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

    public void Awake()
    {
        var saveGridToFileScript = GetComponent<SaveGridToFileScript>();
        serializedGrids = saveGridToFileScript.GetGrids();
    }

    private void Update()
    {
        var objectsAlive = 0;
        
        foreach (var placedGameObject in placedGameObjects)
        {
            if(placedGameObject.GetComponent<Building>().IsAlive()) objectsAlive++;
        }
        
        if (objectsAlive == 0)
        {
            Lose();
        }
    }

    public override void OnEpisodeBegin()
    {
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
            var newObject = Instantiate(prefab, position, rotation);
            placedGameObjects.Add(newObject);
            
        }
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
        
        sensor.AddObservation(Vector2.zero);
        
        var wave = enemyWaveManager.GetWave();
        var enemyPlacements = wave.enemyPlacements;
        sensor.AddObservation(enemyPlacements[0].amount);
        sensor.AddObservation(enemyPlacements[1].amount);
        sensor.AddObservation(enemyPlacements[2].amount);
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
        
        Debug.Log($"Tower Type: {towerType}");
        
        if (towerType == 0)
        {
            return;
        }
        var xScale = placementPlatform.transform.localScale.x;
        var zScale = placementPlatform.transform.localScale.z;
        var side = discreteActions[1];
        
        Debug.Log($"Side: {side}");
        
        var position = Vector3.zero;
        switch (side)
        {
            case 0:
                position = new Vector3(-xScale / 2 + placementPlatform.transform.position.x, 1, 0);
                break;
            case 1:
                position = new Vector3(xScale / 2 + placementPlatform.transform.position.x, 1, 0);
                break;
            case 2:
                position = new Vector3(0, 1, -zScale / 2 + placementPlatform.transform.position.z);
                break;
            case 3:
                position = new Vector3(0, 1, zScale / 2 + placementPlatform.transform.position.z);
                break;
        }
        
        var otherCoordinate = continuousActions[0]; //value between -1 and 1
        Debug.Log($"otherCoordinate: {otherCoordinate}");
        
        if (side == 0 || side == 1)
        {
            position.z = otherCoordinate * zScale / 2 + placementPlatform.transform.position.z;
        }
        else
        {
            position.x = otherCoordinate * xScale / 2 + placementPlatform.transform.position.x;
        }

        enemyWaveManager.SpawnEnemy(towerType - 1, position);
    }
    
    public void KilledBuilding()
    {
        AddReward(+1f);
    }
    
    public void Win()
    {
        AddReward(10f);
        EndEpisode();
    }
    
    public void Lose()
    {
        AddReward(-1f);
        EndEpisode();
    }
}
