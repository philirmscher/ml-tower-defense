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
    private GameObject goToAttack;
    private void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
    }
    private void Start()
    {
        goToAttack = this.GetComponent<EnemyScript>().getNearestObject();
    }

    private void Update()
    {
        FindClostestEnemy();
    }
    
    void FindClostestEnemy()
    {
        goToAttack = this.GetComponent<EnemyScript>().getNearestObject();
        if (goToAttack == null)
        {
            Debug.Log("No building found: " + this.gameObject + " Objekt to Attack: " + goToAttack);
            GameObject gameManager = GameObject.Find("GameManager");
            if (gameManager)
                gameManager.GetComponent<TurnManager>().EndTurn();
            return;
        }

        target = goToAttack.transform;
        
        agent.SetDestination(target.position);
    }
}
