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

    #region General Properties
    [Header("General Properties")]
    [SerializeField] private GameObject alivePrefab;
    [SerializeField] private GameObject destroyedPrefab;
    [SerializeField] private ParticleSystem onDeathVfx;
    [SerializeField] private GameObject[] deathDecalPrefabs;
    [SerializeField] private float health, maxHealth = 100f;
    [SerializeField] private BuildingType buildingType;
    [SerializeField] private bool isAlive = true;
    [SerializeField] private HealthBar healthBar;
    public TurnManager turnManager;
    private Vector3 meshCenterLocal;
    #endregion

    #region Weapon Properties
    [Header("Weapon Properties")]
    [SerializeField] private bool hasWeaponry = true;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private bool hasMortar = false;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private GameObject topPart;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private GameObject cannon;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private GameObject projectilePrefab;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private Transform muzzlePoint1;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private Transform muzzlePoint2;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private float mortarProjectileHeight = 10f;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private float fireRate = 1f;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] public float attackRange = 15f;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] public float minAttackRange = 0f;

    [ConditionalHide("hasWeaponry", true)]
    [SerializeField] private float turnSpeed = 10f;

    private Vector3 cannonStartPosition;
    private Vector3 cannonTargetPosition;
    private float fireCountdown = 0f;
    private Transform target;
    private string enemyTag = "Enemy";
    private BulletScript lastFiredBulletScript;
    private Vector3 initialCannonRotation; 
    private bool useMuzzlePoint1 = true;

    #endregion
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
        if (hasWeaponry)
        {
            initialCannonRotation = cannon.transform.localEulerAngles;
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
                    Quaternion desiredRotation = Quaternion.Euler(-pitchAngle + 68.362f*2, 0f, 0f);
                    Quaternion smoothRotation = Quaternion.Lerp(currentRotation, desiredRotation, Time.deltaTime * turnSpeed);
                    cannon.transform.localRotation = smoothRotation;

                }
                else
                {
                    float heightDifference = target.position.y - cannon.transform.position.y;
                    float horizontalDistance = Vector3.Distance(new Vector3(target.position.x, cannon.transform.position.y, target.position.z), cannon.transform.position);
                    float pitchAngle = Mathf.Atan2(heightDifference, horizontalDistance) * Mathf.Rad2Deg;

                    // Addieren Sie die gespeicherte Anfangsrotation zur berechneten Neigung
                    float newPitch = initialCannonRotation.x + pitchAngle;

                    cannon.transform.localRotation = Quaternion.Euler(newPitch, initialCannonRotation.y, initialCannonRotation.z);
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
        if (turnManager != null)
            turnManager.BuildingDestroyed(this);
        alivePrefab.SetActive(false);
        if (destroyedPrefab)
        {
            destroyedPrefab.SetActive(true);
        }
        InstantiateDecalOnDeath();

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
        if (destroyedPrefab)
        {
            destroyedPrefab.SetActive(false);
        }
        healthBar.UpdateHealthBar(health, maxHealth);
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

            if (distanceToEnemy < shortestDistance && distanceToEnemy > minAttackRange) 
            {
                shortestDistance = distanceToEnemy;
                nearestEnemy = enemy;
            }
        }

        if (nearestEnemy != null && shortestDistance <= attackRange) 
        {
            target = nearestEnemy.transform;
            cannonStartPosition = muzzlePoint1.position;
            cannonTargetPosition = target.position;
        }
        else
        {
            target = null;
        }
    }


    void Shoot()
    {
        Transform currentMuzzlePoint;
        if (muzzlePoint2 != null)
        {
            currentMuzzlePoint = useMuzzlePoint1 ? muzzlePoint1 : muzzlePoint2;
        }
        else
        {
            currentMuzzlePoint = muzzlePoint1;
        }

        GameObject projectileGO = Instantiate(projectilePrefab, currentMuzzlePoint.position, currentMuzzlePoint.rotation);
        BulletScript projectile = projectileGO.GetComponent<BulletScript>();
        projectile.turnManager = this.turnManager;

        if (projectile != null)
        {
            projectile.Seek(target, this.gameObject);
            lastFiredBulletScript = projectile;
        }

        useMuzzlePoint1 = !useMuzzlePoint1;
    }


    public bool IsAlive()
    {
        return isAlive;
    }
    
    public bool HasWeaponry()
    {
        return hasWeaponry;
    }
    
    public BuildingType GetBuildingType()
    {
        return buildingType;
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
    private void InstantiateDecalOnDeath()
    {
        if (deathDecalPrefabs != null && deathDecalPrefabs.Length > 0 && turnManager.type != PlayType.Training)
        {
            GameObject decalPrefab = deathDecalPrefabs[UnityEngine.Random.Range(0, deathDecalPrefabs.Length)];
            Vector3 decalPosition = transform.position;
            Quaternion decalRotation = Quaternion.Euler(90f, 0f, UnityEngine.Random.Range(0f, 360f));
            GameObject decalInstance = Instantiate(decalPrefab, decalPosition, decalRotation);
            float randomSize = UnityEngine.Random.Range(0.4f, 0.8f);
            decalInstance.transform.localScale = new Vector3(randomSize, randomSize, decalInstance.transform.localScale.z);
        }
    }

    void OnDrawGizmos()
    {
        if (hasWeaponry)
        {
            Gizmos.color = Color.blue;
            Gizmos.DrawWireSphere(transform.position, attackRange);

            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, minAttackRange);

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
