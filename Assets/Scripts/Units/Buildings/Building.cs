using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

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

    [SerializeField] private bool hasWeaponry = true;
    [SerializeField] private bool hasMortar = false;

    [SerializeField] private float mortarProjectileHeight = 10f;
    private Vector3 cannonStartPosition;
    private Vector3 cannonTargetPosition;

    [SerializeField] private GameObject topPart;
    [SerializeField] private GameObject cannon;
    [SerializeField] private GameObject projectilePrefab;
    [SerializeField] private Transform muzzlePoint;


    [SerializeField] private GameObject[] flashDamageMeshes;
    private Material[] originalMaterials;

    [SerializeField] private ParticleSystem onDeathVfx;

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

    private BulletScript lastFiredBulletScript;
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

                Vector3 dir1 = target.position - transform.position;
                Quaternion lookRotation1 = Quaternion.LookRotation(dir1);
                Vector3 rotation1 = Quaternion.Lerp(topPart.transform.rotation, lookRotation1, Time.deltaTime * turnSpeed).eulerAngles;

                topPart.transform.rotation = Quaternion.Euler(-90f, rotation1.y, 0f);

                if (hasMortar)
                {
                    Vector3 firstParabolaPoint = MathParabola.Parabola(cannonStartPosition, cannonTargetPosition, mortarProjectileHeight, 0.01f);
                    float heightDifference = firstParabolaPoint.y - cannon.transform.position.y;
                    float horizontalDistance = Vector3.Distance(new Vector3(firstParabolaPoint.x, cannon.transform.position.y, firstParabolaPoint.z), cannon.transform.position);
                    float pitchAngle = Mathf.Atan2(heightDifference, horizontalDistance) * Mathf.Rad2Deg;

                    Quaternion currentRotation = cannon.transform.localRotation;
                    Quaternion desiredRotation = Quaternion.Euler(-pitchAngle, 0f, 0f);
                    Quaternion smoothRotation = Quaternion.Lerp(currentRotation, desiredRotation, Time.deltaTime * turnSpeed);
                    cannon.transform.localRotation = smoothRotation;

                }
                else
                {
                    float heightDifference = target.position.y - cannon.transform.position.y;
                    float horizontalDistance = Vector3.Distance(new Vector3(target.position.x, cannon.transform.position.y, target.position.z), cannon.transform.position);
                    float pitchAngle = Mathf.Atan2(heightDifference, horizontalDistance) * Mathf.Rad2Deg;

                    cannon.transform.localRotation = Quaternion.Euler(-pitchAngle, 0f, 0f);

                }
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
        if(onDeathVfx)
            onDeathVfx.Play();

        isAlive = false;
        alivePrefab.SetActive(false);
        destroyedPrefab.SetActive(true);
        this.gameObject.tag = "Destroyed";
        this.gameObject.GetComponent<BoxCollider>().enabled = false;

        if(this.gameObject.GetComponent<NavMeshObstacle>()) 
            this.gameObject.GetComponent<NavMeshObstacle>().enabled = false;
    }

    public void Repair()
    {
        health = maxHealth;
        isAlive = true;
        alivePrefab.SetActive(true);
        destroyedPrefab.SetActive(false);
        this.gameObject.tag = buildingType.ToString();
        this.gameObject.GetComponent<BoxCollider>().enabled = true;

        if (this.gameObject.GetComponent<NavMeshObstacle>())
            this.gameObject.GetComponent<NavMeshObstacle>().enabled = true;
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
            cannonStartPosition = muzzlePoint.position; // oder wo immer der Startpunkt des Geschosses sein sollte
            cannonTargetPosition = target.position;
        }
        else
        {
            target = null;
        }
    }

    void Shoot()
    {
        GameObject projectileGO = Instantiate(projectilePrefab, muzzlePoint.position, muzzlePoint.rotation);
        BulletScript projectile = projectileGO.GetComponent<BulletScript>();

        if (projectile != null)
        {
            projectile.Seek(target, this.gameObject);
            lastFiredBulletScript = projectile;
        }
    }
    
    public bool IsAlive()
    {
        return isAlive;
    }

    void OnDrawGizmos()
    {
        if (hasWeaponry)
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
}
