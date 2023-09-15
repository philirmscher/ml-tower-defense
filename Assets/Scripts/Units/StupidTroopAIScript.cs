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
    private GameObject gameObjectToAttack;
    private EnemyScript enemyScript;
    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
    }
    private void Start()
    {
        gameObjectToAttack = this.GetComponent<EnemyScript>().getNearestObject();
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

        gameObjectToAttack = enemyScript.getNearestObject();

        if (enemyScript.isWarned && enemyScript.underAttackBy)
        {
            agent.isStopped = false;
            agent.SetDestination(enemyScript.underAttackBy.transform.position);
            return;
        }

        if (gameObjectToAttack == null)
        {
            Debug.Log("No building found: " + this.gameObject + " Objekt to Attack: " + gameObjectToAttack);
            GameObject gameManager = GameObject.Find("GameManager");
            if (gameManager)
            {
                gameManager.GetComponent<TurnManager>().EndTurn();
                return;
            }
            Debug.Log("Error: No game manager found");
            return;
        }

        target = gameObjectToAttack.transform;

        Debug.Log("Move to. " + target.ToString());
        if (enemyScript.getIsInAttackRange())
        {
            agent.isStopped = true;
        }
        else
        {
            agent.isStopped = false;
            agent.SetDestination(target.position);
        }
        
    }
}
