using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class StupidTroopAIScript : MonoBehaviour
{
    [SerializeField] private float speed = 5f;
    public NavMeshAgent agent;
    private GameObject target;
    private EnemyScript enemyScript;
    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
    }
    private void Start()
    {
        target = this.GetComponent<EnemyScript>().getNearestObject();
        agent.SetDestination(target.transform.position);
    }

    private void Update()
    {
        FindClostestEnemy();
    }
    
    void FindClostestEnemy()
    {

        if(enemyScript == null)
        {
            enemyScript = this.GetComponent<EnemyScript>();
        }

        if (enemyScript.isAlive == false)
        {
            agent.isStopped = true;
            return;
        }

        GameObject newTarget = enemyScript.getNearestObject();

        if (enemyScript.isWarned && enemyScript.underAttackBy)
        {
            agent.isStopped = false;
            if (newTarget.transform.position != target.transform.position || target == null)
            {
                target = newTarget;
                agent.SetDestination(target.transform.position);
            }
            return;
        }

        if (newTarget == null)
        {
            return;
        }


        if (enemyScript.getIsInAttackRange() && enemyScript.gameObjectToAttack.tag != "Wall")
        {
            agent.isStopped = true;
        }
        else
        {
            agent.isStopped = false;

            if (newTarget.transform.position != target.transform.position || target == null)
            {
                target = newTarget;
                agent.SetDestination(target.transform.position);
            }
        }
        
    }
}
