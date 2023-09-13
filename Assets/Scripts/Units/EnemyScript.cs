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

    [SerializeField] private GameObject[] flashDamageMeshes;
    private Material[] originalMaterials;

    public Material damageMaterial;

    [SerializeField] private HealthBar healthBar;

    private float attackCountdown = 0f;

    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
    }
    private void Start()
    {
        saveOriginalMaterials();
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
        if (flashDamageMeshes.Length != 0 && originalMaterials != null)
        {
            setMaterials(damageMaterial);
            yield return new WaitForSeconds(0.1f);
            setMaterials(originalMaterials);

        }
    }

    private void setMaterials(Material material)
    {
        int index = 0;
        foreach (GameObject flashDamageMesh in flashDamageMeshes)
        {
            flashDamageMeshes[index].GetComponent<Renderer>().material = material;
            index++;
        }
    }

    private void setMaterials(Material[] material)
    {
        int index = 0;
        foreach (GameObject flashDamageMesh in flashDamageMeshes)
        {
            flashDamageMeshes[index].GetComponent<Renderer>().material = material[index];
            index++;
        }
    }


    private void saveOriginalMaterials()
    {

        if (flashDamageMeshes.Length != 0 && originalMaterials == null)
        {
            originalMaterials = new Material[flashDamageMeshes.Length];
            int index = 0;
            foreach (GameObject flashDamageMesh in flashDamageMeshes)
            {
                originalMaterials[index] = flashDamageMeshes[index].GetComponent<Renderer>().material;
                index++;
            }
        }
    }

    void Die()
    {
        Destroy(gameObject);
    }
    
    void Update()
    {
        var buildings = GameObject.FindGameObjectsWithTag("Tower");
        
        if(buildings.Length == 0)
            return;
        
        var nearestBuilding = buildings[0];
        
        foreach (var building in buildings)
        {
            var distanceToTower = Vector3.Distance(transform.position, building.transform.position);
            
            if (distanceToTower < Vector3.Distance(transform.position, nearestBuilding.transform.position))
            {
                nearestBuilding = building;
            }
        }
        
        
        var distance = Vector3.Distance(transform.position, nearestBuilding.transform.position);
            
        if (distance <= attackRange)
        {
            if (attackCountdown <= 0f)
            {
                Attack(nearestBuilding);
                attackCountdown = 1f / attackRate;
            }
                
            attackCountdown -= Time.deltaTime;
        }
    }
    
    void Attack(GameObject building)
    {
        var buildingScript = building.GetComponent<Building>();
        
        buildingScript.TakeDamage(damage);
    }
    
    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);
    }
}
