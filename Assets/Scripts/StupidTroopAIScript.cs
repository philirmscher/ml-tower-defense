using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class StupidTroopAIScript : MonoBehaviour
{
    Transform target;
    
    [SerializeField] private float speed = 5f;
    private NavMeshAgent agent;
    
    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
    }

    private void Update()
    {
        FindClostestEnemy();
    }
    
    void FindClostestEnemy()
    {
        var enemies = GameObject.FindGameObjectsWithTag("Tower");
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
