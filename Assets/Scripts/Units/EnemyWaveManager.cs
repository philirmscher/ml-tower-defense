using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using Random = UnityEngine.Random;

[System.Serializable]
public class Vec3
{
    public float x;
    public float y;
    public float z;
}

[Serializable]
public enum PlayType
{
    Demo,
    Training,
    Play
}

public class EnemyWaveManager : MonoBehaviour
{
    [SerializeField] private TurnManager turnManager;
    private List<GameObject> enemies = new ();
    private bool allEnemiesSpawned;
    private EnemyWave enemyWave;
    [SerializeField] private PlayType type;

    [SerializeField]
    [Tooltip("The position where the enemies will spawn")]
    [Header("Only used in Demo mode")]
    private Vec3 spawnPosition = new Vec3();

    [SerializeField]
    [Tooltip("The agent that will be used in the demo")]
    [Header("Only used in Training mode")]
    private MLTDAgent agent;

    public void StartWave(EnemyWave enemyWave)
    {
        this.enemyWave = enemyWave;
        if (type != PlayType.Demo)
            return;
        
        StartCoroutine(StartDemoWave());
    }
    
    public IEnumerator StartDemoWave()
    {
        foreach (var enemyPlacement in enemyWave.enemyPlacements)
        {
            for (int i = 0; i < enemyPlacement.amount; i++)
            {
                var spawn = new Vector3(spawnPosition.x, spawnPosition.y, spawnPosition.z);
                if (spawn != Vector3.zero)
                {
                    var obj = Instantiate(enemyPlacement.prefab, VariantVector(spawn), Quaternion.identity);
                    obj.AddComponent<StupidTroopAIScript>();
                    enemies.Add(obj);
                }
                else
                {
                    var obj = Instantiate(enemyPlacement.prefab, Vector3.zero, Quaternion.identity);
                    obj.AddComponent<StupidTroopAIScript>();
                    enemies.Add(obj);
                }
                yield return new WaitForSeconds(0.3f);
            }
        }
        
        allEnemiesSpawned = true;
    }
    
    public EnemyWave GetWave()
    {
        return enemyWave;
    }
    
    public void SpawnEnemy(int index, Vector3 position)
    {
        var troopCount = 0;
        foreach (var enemyPlacement in enemyWave.enemyPlacements)
        {
            troopCount += enemyPlacement.amount;
        }
        
        if(!allEnemiesSpawned || enemies.Count >= troopCount) allEnemiesSpawned = true;
        if(enemyWave.enemyPlacements[index].amount <= 0)
            return;
        
        enemyWave.enemyPlacements[index].amount--;
        
        var enemy = Instantiate(enemyWave.enemyPlacements[index].prefab, position, Quaternion.identity);
        enemies.Add(enemy);
    }

    public void Update()
    {
        for (var i = 0; i < enemies.Count; i++)
        {
            if (enemies.Count <= i || enemies.Count == 0)
            {
                break;
            }
            
            if (enemies[i] == null)
            {
                enemies.RemoveAt(i);
                if(type == PlayType.Training) agent.KilledBuilding();
                i--;
            }
        }
        
        if (allEnemiesSpawned && enemies.Count == 0)
        {
            allEnemiesSpawned = false;
            if(type == PlayType.Training) agent.Lose();
            turnManager.StartPreTurnPhase();
        }
    }
    
    private static Vector3 VariantVector(Vector3 vector)
    {
        var vec = vector;
        vec.x += Random.Range(-3f, 3f);
        vec.z += Random.Range(-3f, 3f);
        return vec;
    }
}