using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StupidTroopAIScript : MonoBehaviour
{
    Transform target;

    private void Update()
    {
        var towers = GameObject.FindGameObjectsWithTag("Tower");
        var closestTower = towers[0];
        var closestDistance = Vector3.Distance(transform.position, closestTower.transform.position);
        
        foreach (var tower in towers)
        {
            var distance = Vector3.Distance(transform.position, tower.transform.position);
            if (distance < closestDistance)
            {
                closestTower = tower;
                closestDistance = distance;
            }
        }
        
        target = closestTower.transform;
        
        Move();
    }
    
    void Move()
    {
        EnemyScript enemyScript = GetComponent<EnemyScript>();
        
        if (Vector3.Distance(transform.position, target.position) <= enemyScript.attackRange)
        {
            return;
        }
        
        var direction = target.position - transform.position;
        
        var angle = Vector3.Angle(direction, transform.forward);
        
        if (angle > 5f)
        {
            var sign = Mathf.Sign(Vector3.Dot(transform.right, direction));
            enemyScript.Rotate((int)sign);
        }
        else
        {
            enemyScript.Move(1);
        }
    }
}
