using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;

[System.Serializable]
public class Vec3
{
    public float x;
    public float y;
    public float z;
}

public class EnemyWaveManager : MonoBehaviour
{
    [SerializeField] private TurnManager turnManager;
    private List<GameObject> enemies = new ();
    private bool enemiesSpawned;
    private EnemyWave enemyWave;
    [SerializeField] private bool isDemo;
    [SerializeField] private Vec3 spawnPosition = new Vec3();

    public void StartWave(EnemyWave enemyWave)
    {
        this.enemyWave = enemyWave;
        if (!isDemo)
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
        
        enemiesSpawned = true;
    }
    
    public EnemyWave GetWave()
    {
        return enemyWave;
    }
    
    public void SpawnEnemy(int index, Vector3 position)
    {
        if(!enemiesSpawned)
            enemiesSpawned = true;
        if(enemyWave.enemyPlacements[index].amount <= 0)
            return;
        
        enemyWave.enemyPlacements[index].amount--;
        
        var enemy = Instantiate(enemyWave.enemyPlacements[index].prefab, position, Quaternion.identity);
        enemies.Add(enemy);
    }

    public void Update()
    {
        if(!enemiesSpawned)
            return;
        for (var i = 0; i < enemies.Count; i++)
        {
            if (enemies.Count <= i || enemies.Count == 0)
            {
                break;
            }
            
            if (enemies[i] == null)
            {
                enemies.RemoveAt(i);
                i--;
            }
        }
        
        if (enemies.Count == 0)
        {
            enemiesSpawned = false;
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