using System;
using System.Collections;
using System.Collections.Generic;
using Unity.MLAgents;
using Unity.MLAgents.Actuators;
using Unity.MLAgents.Sensors;
using UnityEngine;

public class MLTDAgent : Agent
{
    [SerializeField] private GameObject placementPlatform;
    [SerializeField] private EnemyWaveManager enemyWaveManager;
    [SerializeField] private TurnManager turnManager;
    [SerializeField] private GameObject[] prefabs;
    private List<GameObject> placedGameObjects = new();
    
    private SerializedGrids serializedGrids;
    private float timeAtStart;

    public void Awake()
    {
        var saveGridToFileScript = GetComponent<SaveGridToFileScript>();
        serializedGrids = saveGridToFileScript.GetGrids();
    }

    private void Update()
    {
        if(placedGameObjects.Count == 0) return;
        var objectsAlive = 0;
        
        if(Time.time - timeAtStart > 300)
        {
            Lose();
        }
        
        foreach (var placedGameObject in placedGameObjects)
        {
            var building = placedGameObject.GetComponent<Building>();
            if (building.IsAlive())
                objectsAlive++;
        }

        if (objectsAlive == 0)
        {
            Lose();
        }
    }

    public override void OnEpisodeBegin()
    {
        turnManager.StartPreTurnPhase();
        
        //remove all placed objects
        foreach (var placedGameObject in placedGameObjects)
        {
            Destroy(placedGameObject);
        }
        
        placedGameObjects.Clear();
        
        //load random grid
        var randomGrid = serializedGrids.grids[UnityEngine.Random.Range(0, serializedGrids.grids.Length)];
        
        foreach (var serializedGridObject in randomGrid.gridObjects)
        {
            var prefab = GetPrefabByName(serializedGridObject.name);
            if (prefab == null)
            {
                Debug.LogError($"Prefab with name {serializedGridObject.name} not found!");
                continue;
            }
            
            var rotation = Quaternion.Euler(serializedGridObject.rotation);
            var position = serializedGridObject.position;
            var newObject = Instantiate(prefab, position + placementPlatform.transform.position, rotation);
            placedGameObjects.Add(newObject);
            
        }
        timeAtStart = Time.time;
        turnManager.StartTurnPhase();
    }
    
    private GameObject GetPrefabByName(string name)
    {
        foreach (var prefab in prefabs)
        {
            if (prefab.name == name)
            {
                return prefab;
            }
        }

        return null;
    }

    public override void Heuristic(in ActionBuffers actionsOut)
    {
        ActionSegment<float> continuousActions = actionsOut.ContinuousActions;
        continuousActions[0] = Input.GetAxis("Horizontal");
        ActionSegment<int> discreteActions = actionsOut.DiscreteActions;
        discreteActions[0] = Input.GetKey(KeyCode.Alpha1) ? 1 : Input.GetKey(KeyCode.Alpha2) ? 2 : Input.GetKey(KeyCode.Alpha3) ? 3 : 0;
    }
    
    public override void CollectObservations(VectorSensor sensor)
    {
        /*
         * Observation Space
         * 1-3: Resource Tower Position
         * 4: Archer Amount
         * 5: Melee Amount
         * 6: Tank Amount
         * 7-631: Grid with Placement Positions and Tower Types (0: None, 1: Sniper, 2: Machine Gun, 3: Morter)
         */
        var wave = enemyWaveManager.GetWave();
        var enemyPlacements = wave.enemyPlacements;
        sensor.AddObservation(enemyPlacements[0].amount);
        sensor.AddObservation(enemyPlacements[1].amount);
        sensor.AddObservation(enemyPlacements[2].amount);
        
        var gridSize = 40;
        var grid = new int[gridSize * gridSize];
        foreach (var placedGameObject in placedGameObjects)
        {
            var building = placedGameObject.name;
            var position = placedGameObject.transform.position;
            var x = (int)(position.x + 20);
            var z = (int)(position.z + 20);
            // get index of building in prefabs
            var index = 0;
            foreach (var prefab in prefabs)
            {
                if (prefab.name == building)
                {
                    break;
                }

                index++;
            }

            // Convert 2D coordinates to 1D index
            var gridIndex = x + z * gridSize;
            grid[gridIndex] = index;
        }
        
        foreach (var gridValue in grid)
        {
            sensor.AddObservation(gridValue);
        }
    }

    public override void OnActionReceived(ActionBuffers actions)
    {
        /*
         * Discrete Action
         * 0: None
         * 1: Archer
         * 2: Melee
         * 3: Tank
         * Continuous Action
         * Placement Position
         */
        
        var discreteActions = actions.DiscreteActions;
        var continuousActions = actions.ContinuousActions;

        var towerType = discreteActions[0];

        if (towerType == 0)
        {
            return;
        }
        var xScale = placementPlatform.transform.localScale.x;
        var zScale = placementPlatform.transform.localScale.z;
        var side = discreteActions[1];
        
        var position = Vector3.zero;
        switch (side)
        {
            case 0:
                position = new Vector3(-xScale / 2, 1, 0);
                break;
            case 1:
                position = new Vector3(xScale / 2, 1, 0);
                break;
            case 2:
                position = new Vector3(0, 1, -zScale / 2);
                break;
            case 3:
                position = new Vector3(0, 1, zScale / 2);
                break;
        }
        
        var otherCoordinate = continuousActions[0]; //value between -1 and 1
        
        if (side == 0 || side == 1)
        {
            position.z = otherCoordinate * zScale / 2;
        }
        else
        {
            position.x = otherCoordinate * xScale / 2;
        }

        enemyWaveManager.SpawnEnemy(towerType - 1, position + placementPlatform.transform.position);
    }
    
    public void KilledBuilding()
    {
        AddReward(+1f);
        Debug.Log("Killed Building");
    }
    
    public void Win()
    {
        AddReward(10);
        AddReward((300 - (Time.time - timeAtStart)) / 50);
        Debug.Log("Won " + GetCumulativeReward());
        EndEpisode();
    }
    
    public void Lose()
    {
        AddReward(-1f);
        Debug.Log("Lost " + GetCumulativeReward());
        EndEpisode();
    }
}
