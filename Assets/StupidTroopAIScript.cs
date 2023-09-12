using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class StupidTroopAIScript : MonoBehaviour
{
    Transform target;
    
    private NavMeshAgent agent;
    private EnemyScript enemyScript;
    
    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        enemyScript = GetComponent<EnemyScript>();
        agent.speed = enemyScript.GetSpeed()/10;
    }

    private void Update()
    {
        FindClostestEnemy();
    }
    
    void FindClostestEnemy()
    {
        var enemies = GameObject.FindGameObjectsWithTag("Tower");
        agent.SetDestination(transform.position);
        if (enemies.Length == 0)
        {
            return;
        }
        var closestEnemy = enemies[0];
        var closestDistance = Vector3.Distance(transform.position, closestEnemy.transform.position);
        foreach (var enemy in enemies)
        {
            var distance = Vector3.Distance(transform.position, enemy.transform.position);
            if (distance < closestDistance)
            {
                closestEnemy = enemy;
                closestDistance = distance;
            }
        }

        target = closestEnemy.transform;
        
        agent.SetDestination(target.position);
    }
}
