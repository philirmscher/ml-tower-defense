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

    public IEnumerator StartWave(EnemyWave enemyWave)
    {
        this.enemyWave = enemyWave;
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
}