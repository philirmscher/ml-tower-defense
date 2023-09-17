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

    [SerializeField] private ParticleSystem onDeathVfx;

    [SerializeField] private float health, maxHealth = 100f;
    [SerializeField] private BuildingType buildingType;
    [SerializeField] private bool isAlive = true;

    [SerializeField] private float fireRate = 1f;
    [SerializeField] public float attackRange = 15f;
    [SerializeField] private float fireSpan = 10f;
    [SerializeField] private float turnSpeed = 10f;

    [SerializeField] private Material damageMaterial;

    [SerializeField] private HealthBar healthBar;



    private float fireCountdown = 0f;
    private Transform target;
    private string enemyTag = "Enemy";

    private BulletScript lastFiredBulletScript;
    private Vector3 meshCenterLocal;
    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
        this.gameObject.tag = buildingType.ToString();
        CalculateMeshCenter();
    }
    void Start()
    {
        if(hasWeaponry)
            InvokeRepeating("UpdateTarget", 0f, 0.5f);

        health = maxHealth;
        healthBar.UpdateHealthBar(health, maxHealth);

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

        if (nearestEnemy != null && shortestDistance <= attackRange)
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
    private void CalculateMeshCenter()
    {
        MeshRenderer[] meshRenderers = gameObject.GetComponentsInChildren<MeshRenderer>();
        Vector3 totalCenter = Vector3.zero;

        foreach (MeshRenderer meshRenderer in meshRenderers)
        {
            totalCenter += meshRenderer.bounds.center;
        }

        meshCenterLocal = totalCenter / meshRenderers.Length;
    }

    public Vector3 GetMeshCenterInWorld()
    {
        Collider collider = GetComponent<Collider>();
        if (collider)
        {
            return collider.bounds.center;
        }
        else
        {
            Debug.LogWarning("No Collider found on the GameObject! Using local mesh center instead.");
            return transform.TransformPoint(meshCenterLocal);
        }
    }

    void OnDrawGizmos()
    {
        if (hasWeaponry)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, attackRange);

            Gizmos.color = Color.blue;
            Gizmos.DrawRay(transform.position, transform.forward * attackRange);
            BulletScript bullet = projectilePrefab.GetComponent<BulletScript>();

            if (bullet != null)
            {
                Gizmos.color = Color.green;
                Gizmos.DrawWireSphere(transform.position, bullet.explosionRadius);
            }
        }
    }
}
