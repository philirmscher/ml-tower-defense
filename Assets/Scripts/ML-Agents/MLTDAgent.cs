using System;
using System.Collections;
using System.Collections.Generic;
using Unity.MLAgents;
using Unity.MLAgents.Actuators;
using Unity.MLAgents.Sensors;
using Unity.VisualScripting;
using UnityEngine;

public class MLTDAgent : Agent
{
    [SerializeField] private GameObject placementPlatform;
    [SerializeField] private GameObject[] prefabs;
    [Header("Reward Settings")]
    [SerializeField] private float rewardPerKill = .1f;
    [SerializeField] private float rewardForBaseKill = 1f;
    [SerializeField] private float timeRewardDivisor = 63f;
    [SerializeField] private float winReward = 3f;
    [SerializeField] private float loseReward = -5f;
    [SerializeField] private TurnManager turnManager;
    private List<GameObject> placedGameObjects = new ();

    private SerializedGrids serializedGrids;

    public void Start()
    {
        var saveGridToFileScript = GetComponent<SaveGridToFileScript>();
        serializedGrids = saveGridToFileScript.GetGrids();
        turnManager.onBuildingDestroyed.AddListener(KilledBuilding);
        turnManager.onTurnEnd.AddListener((won, time) =>
        {
            if (won)
            {
                Win(time);
            }
            else
            {
                Lose();
            }
        });
    }

    public override void OnEpisodeBegin()
    {
        Debug.Log("Started Episode");
        
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
            turnManager.RegisterBuilding(newObject.GetComponent<Building>());
        }
        
        turnManager.StartTurnPhase();
        Debug.Log("Started Turn");
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
        discreteActions[0] = Input.GetKey(KeyCode.Alpha1) ? 1 :
            Input.GetKey(KeyCode.Alpha2) ? 2 :
            Input.GetKey(KeyCode.Alpha3) ? 3 : 0;
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
        var wave = turnManager.currentEnemyWave;
        if (wave == null)
        {
            sensor.AddObservation(0f);
            sensor.AddObservation(0f);
            sensor.AddObservation(0f);
        }
        else
        {
            var enemyPlacements = wave.enemyPlacements;
            sensor.AddObservation(enemyPlacements[0].amount);
            sensor.AddObservation(enemyPlacements[1].amount);
            sensor.AddObservation(enemyPlacements[2].amount);
        }

        var gridSize = 40;
        var grid = new int[40][];
        for (var i = 0; i < gridSize; i++)
        {
            grid[i] = new int[gridSize];
        }

        foreach (var placedGameObject in placedGameObjects)
        {
            if(placedGameObject == null) continue;
            var building = placedGameObject.GetComponent<Building>();
            if (!building.IsAlive()) continue;
            var position = placedGameObject.transform.localPosition;
            var x = (int) (position.x + 20 - placementPlatform.transform.position.x);
            var z = (int) (position.z + 20 - placementPlatform.transform.position.z);
            grid[x][z] = GetTowerType(placedGameObject) + 2;
        }

        foreach (var gridValue in grid)
        {
            foreach (var value in gridValue)
            {
                sensor.AddObservation(value);
            }
        }
    }

    private int GetTowerType(GameObject go)
    {
        var index = 0;
        foreach (var prefab in prefabs)
        {
            if (prefab == go)
            {
                return index;
            }

            index++;
        }

        return -1;
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

        turnManager.SpawnEnemy(towerType - 1, position + placementPlatform.transform.position);
    }

    private void KilledBuilding(Building building, int weaponAmount)
    {
        if (building.GetBuildingType() == Building.BuildingType.Base)
        {
            for (int i = 0; i < weaponAmount; i++)
            {
                AddReward(rewardPerKill);
            }
            AddReward(rewardForBaseKill);
        }
        else if(building.GetBuildingType() == Building.BuildingType.Tower)
            AddReward(rewardPerKill);
    }

    private void Win(float timeTaken)
    {
        AddReward(winReward);
        AddReward(timeRewardDivisor / timeTaken);
        Debug.Log("Won " + GetCumulativeReward());
        EndEpisode();
    }

    private void Lose()
    {
        AddReward(loseReward);
        Debug.Log("Lost " + GetCumulativeReward());
        EndEpisode();
    }
}