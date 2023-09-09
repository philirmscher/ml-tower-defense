using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyScript : MonoBehaviour
{
    public float speed = 10f;
    public float turnSpeed = 10f;
    public float health = 100f;
    public float damage = 10f;
    public float attackRange = 2f;
    public float attackRate = 1f;
    
    public Material damageMaterial;
    
    private float attackCountdown = 0f;
    
    public void Move(int direction)
    {
        transform.Translate(Vector3.forward * direction * speed * Time.deltaTime);
    }
    
    public void Rotate(int direction)
    {
        transform.Rotate(Vector3.up * direction * turnSpeed * Time.deltaTime);
    }
    
    public void TakeDamage(float amount)
    {
        health -= amount;
        
        StartCoroutine(FlashDamage());

        if (health <= 0f)
        {
            Die();
        }
    }
    
    IEnumerator FlashDamage()
    {
        var renderer = GetComponent<Renderer>();
        
        var originalMaterial = renderer.material;
        
        renderer.material = damageMaterial;
        
        yield return new WaitForSeconds(0.1f);
        
        renderer.material = originalMaterial;
    }
    
    void Die()
    {
        Destroy(gameObject);
    }
    
    void Update()
    {
        var towers = GameObject.FindGameObjectsWithTag("Tower");
        
        if(towers.Length == 0)
            return;
        
        var nearestTower = towers[0];
        
        foreach (var tower in towers)
        {
            var distanceToTower = Vector3.Distance(transform.position, tower.transform.position);
            
            if (distanceToTower < Vector3.Distance(transform.position, nearestTower.transform.position))
            {
                nearestTower = tower;
            }
        }
        
        
        var distance = Vector3.Distance(transform.position, nearestTower.transform.position);
            
        if (distance <= attackRange)
        {
            if (attackCountdown <= 0f)
            {
                Attack(nearestTower);
                attackCountdown = 1f / attackRate;
            }
                
            attackCountdown -= Time.deltaTime;
        }
    }
    
    void Attack(GameObject tower)
    {
        var towerScript = tower.GetComponent<TowerScript>();
        
        towerScript.TakeDamage(damage);
    }
    
    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);
    }
}
