using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;

public class Building : MonoBehaviour
{
    public enum BuildingType
    {
        Wall,
        RessourceTower,
        Tower,
        Base
    }

    [SerializeField] private GameObject alivePrefab;
    [SerializeField] private GameObject destroyedPrefab;
    [SerializeField] private GameObject gunPrefab;
    [SerializeField] private GameObject projectilePrefab;
    [SerializeField] private Transform muzzlePoint;

    [SerializeField] private GameObject[] flashDamageMeshes;
    private Material[] originalMaterials;

    [SerializeField] private ParticleSystem onDeathVfx;
    [SerializeField] private ParticleSystem projectile;

    [SerializeField] private bool hasWeaponry = true;
    [SerializeField] private float health, maxHealth = 100f;
    [SerializeField] private BuildingType buildingType;
    [SerializeField] private bool isAlive = true;

    [SerializeField] private float fireRate = 1f;
    [SerializeField] private float range = 15f;
    [SerializeField] private float fireSpan = 10f;
    [SerializeField] private float turnSpeed = 10f;

    [SerializeField] private Material damageMaterial;

    [SerializeField] private HealthBar healthBar;



    private float fireCountdown = 0f;
    private Transform target;
    private string enemyTag = "Enemy";
    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
        this.gameObject.tag = buildingType.ToString();
        //alivePrefab.tag = buildingType.ToString();
    }
    void Start()
    {
        InvokeRepeating("UpdateTarget", 0f, 0.5f);
        health = maxHealth;
        healthBar.UpdateHealthBar(health, maxHealth);
        saveOriginalMaterials();
        
    }
    public void TakeDamage(float amount)
    {
        health -= amount;
        healthBar.UpdateHealthBar(health, maxHealth);
        StartCoroutine(FlashDamage());
    }

    IEnumerator FlashDamage()
    {
        if(flashDamageMeshes.Length != 0 && originalMaterials != null)
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
        onDeathVfx.Play();
        isAlive = false;
        alivePrefab.SetActive(false);
        destroyedPrefab.SetActive(true);
    }

    public void Repair()
    {
        health = maxHealth;
        isAlive = true;
        alivePrefab.SetActive(true);
        destroyedPrefab.SetActive(false);
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
        if (isAlive)
        {
            if (health <= 0f)
            {
                Die();
            }

            if (hasWeaponry)
            {
                if (target == null)
                {
                    return;
                }

                Vector3 dir = target.position - transform.position;
                Quaternion lookRotation = Quaternion.LookRotation(dir);
                Vector3 rotation = Quaternion.Lerp(gunPrefab.transform.rotation, lookRotation, Time.deltaTime * turnSpeed).eulerAngles;

                gunPrefab.transform.rotation = Quaternion.Euler(0f, rotation.y, 0f);

                if (fireCountdown <= 0f)
                {
                    Shoot();
                    fireCountdown = 1f / fireRate;
                }

                fireCountdown -= Time.deltaTime;
            }

        }
        else
        {
            if (health > 0f)
            {
                Repair();
            }
        }
    }

    void Shoot()
    {
        GameObject projectileGO = Instantiate(projectilePrefab, muzzlePoint.position, muzzlePoint.rotation);
        BulletScript projectile = projectileGO.GetComponent<BulletScript>();

        if (projectile != null)
        {
            projectile.Seek(target);
        }
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, range);

        Gizmos.color = Color.blue;
        Gizmos.DrawRay(transform.position, transform.forward * range);

        BulletScript bullet = projectilePrefab.GetComponent<BulletScript>();

        if (bullet != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawWireSphere(transform.position, bullet.explosionRadius);
        }
    }
}