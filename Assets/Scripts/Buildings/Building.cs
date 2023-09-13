using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;

public class Building : MonoBehaviour
{
    [SerializeField] private GameObject alivePrefab;
    [SerializeField] private GameObject destroyedPrefab;
    [SerializeField] private GameObject bulletPrefab;
    [SerializeField] private Transform muzzlePoint;

    [SerializeField] private bool hasWeaponry = true;
    [SerializeField] private float health, maxHealth = 100f;

    [SerializeField] private float fireRate = 1f;
    [SerializeField] private float range = 15f;
    [SerializeField] private float fireSpan = 10f;
    [SerializeField] private float turnSpeed = 10f;

    [SerializeField] private Material damageMaterial;

    [SerializeField] private HealthBar healthBar;

    public event Action OnHealthZero;


    private float fireCountdown = 0f;
    private Transform target;
    private string enemyTag = "Enemy";
    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
    }
    void Start()
    {
        InvokeRepeating("UpdateTarget", 0f, 0.5f);
        health = maxHealth;
        healthBar.UpdateHealthBar(health, maxHealth);
    }
    public void TakeDamage(float amount)
    {
        health -= amount;
        healthBar.UpdateHealthBar(health, maxHealth);
        StartCoroutine(FlashDamage());

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
        Vector3 deathPos = this.gameObject.transform.position;
        Quaternion deathRot = this.gameObject.transform.rotation;
        Destroy(this.gameObject);
        GameObject prefabToSpawn = Instantiate(destroyedPrefab, deathPos, deathRot);
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
        if (health <= 0f)
        {
            Die();
        }

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

            if (fireCountdown <= 0f)
            {
                Shoot();
                fireCountdown = 1f / fireRate;
            }

            fireCountdown -= Time.deltaTime;
        }
    }

    void Shoot()
    {
        GameObject bulletGO = Instantiate(bulletPrefab, muzzlePoint.position, muzzlePoint.rotation);
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
        Gizmos.DrawRay(transform.position, transform.forward * range);

        BulletScript bullet = bulletPrefab.GetComponent<BulletScript>();

        if (bullet != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawWireSphere(transform.position, bullet.explosionRadius);
        }
    }
}
