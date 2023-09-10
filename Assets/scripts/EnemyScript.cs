using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyScript : MonoBehaviour
{
    [SerializeField] private float speed = 10f;
    [SerializeField] private float turnSpeed = 10f;
    [SerializeField] private float health, maxHealth = 100f;
    [SerializeField] private float damage = 10f;
    [SerializeField] private float attackRange = 2f;
    [SerializeField] private float attackRate = 1f;

    [SerializeField] private HealthBar healthBar;

    public Material damageMaterial;
    
    private float attackCountdown = 0f;

    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
    }
    private void Start()
    {
        health = maxHealth;
        healthBar.UpdateHealthBar(health, maxHealth);
    }

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
        healthBar.UpdateHealthBar(health, maxHealth);
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
