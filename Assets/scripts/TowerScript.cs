using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TowerScript : MonoBehaviour
{

    public GameObject bulletPrefab;
    public Transform firePoint;
    
    public float health = 100f;
    
    public float fireRate = 1f;
    public float range = 15f;
    public float fireSpan = 10f;
    public float turnSpeed = 10f;
    
    public Material damageMaterial;

    private float fireCountdown = 0f;
    private Transform target;
    private string enemyTag = "Enemy";
    
    void Start()
    {
        InvokeRepeating("UpdateTarget", 0f, 0.5f);
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
    
    void UpdateTarget()
    {
        GameObject[] enemies = GameObject.FindGameObjectsWithTag(enemyTag);
        float shortestDistance = Mathf.Infinity;
        GameObject nearestEnemy = null;
        
        foreach (GameObject enemy in enemies)
        {
            float distanceToEnemy = Vector3.Distance(transform.position, enemy.transform.position);
            
            if (distanceToEnemy < shortestDistance)
            {
                shortestDistance = distanceToEnemy;
                nearestEnemy = enemy;
            }
        }
        
        if (nearestEnemy != null && shortestDistance <= range)
        {
            target = nearestEnemy.transform;
        }
        else
        {
            target = null;
        }
    }
    
    void Update()
    {
        if (true)
        {
            if (target == null)
            {
                return;
            }
            
            Vector3 dir = target.position - transform.position;
            Quaternion lookRotation = Quaternion.LookRotation(dir);
            Vector3 rotation = Quaternion.Lerp(transform.rotation, lookRotation, Time.deltaTime * turnSpeed).eulerAngles;
            transform.rotation = Quaternion.Euler(0f, rotation.y, 0f);
            
            //test if the target is within the fire span
            Vector3 targetDir = target.position - transform.position;
            float angle = Vector3.Angle(targetDir, transform.forward);
            
            Debug.Log(angle);
            
            if (angle < fireSpan)
            {
                if (fireCountdown <= 0f)
                {
                    Shoot();
                    fireCountdown = 1f / fireRate;
                }
                
                fireCountdown -= Time.deltaTime;
            }
        }
    }
    
    void Shoot()
    {
        GameObject bulletGO = (GameObject)Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
        BulletScript bullet = bulletGO.GetComponent<BulletScript>();
        
        if (bullet != null)
        {
            bullet.Seek(target);
        }
    }
    
    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, range);
        
        Gizmos.color = Color.blue;
        Gizmos.DrawLine(transform.position, transform.position + transform.forward * range + transform.right * fireSpan);
        Gizmos.DrawLine(transform.position, transform.position + transform.forward * range - transform.right * fireSpan);
        
        BulletScript bullet = bulletPrefab.GetComponent<BulletScript>();
        
        if (bullet != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawWireSphere(transform.position, bullet.explosionRadius);
        }
    }
}
