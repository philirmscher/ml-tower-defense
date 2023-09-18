using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Events;

public class EnemyScript : MonoBehaviour
{
    #region Value Properties
    [Header("Values")]
    [SerializeField] public int pointsWhenKilled = 1;
    #endregion
    
    #region Movement Properties
    [Header("Movement")]
    [SerializeField] private float speed = 10f;
    [SerializeField] private float turnSpeed = 10f;
    #endregion

    #region Health Properties
    [Header("Health")]
    [SerializeField] private float health;
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private HealthBar healthBar;
    public Material damageMaterial;
    public bool isAlive = true;
    private bool isDestroying = false;
    #endregion

    #region Attack Properties
    [Header("Attack")]
    [SerializeField] private float damage = 10f;
    [SerializeField] private float secondsBetweenShots = 1f;  // Previously fireRate
    [SerializeField] public float attackRange = 15f;
    [SerializeField] private Building.BuildingType[] attackPrioList;
    [SerializeField] String neverMoveToPrio = "Wall";
    private float timeUntilNextShot = 0f;  // Previously fireCountdown
    private float attackCountdown = 0f;
    public GameObject gameObjectToAttack;
    private bool isInAttackRange = false;
    #endregion

    #region Alert Properties
    [Header("Alert")]
    [SerializeField] private float alertRadius = 1f;
    [SerializeField] private float alertDuration = 1f; // Zeit in Sekunden, nach der die Warnung zurückgesetzt wird
    public GameObject underAttackBy;
    public bool isWarned = false;
    [SerializeField] private float moveToAttackerTime = 1;
    private bool isResettingUnderAttackBy = false;
    private Coroutine resetCoroutine;
    #endregion

    #region VFX Properties
    [Header("Visual Effects")]
    [SerializeField] private ParticleSystem onDeathVfx1;
    [SerializeField] private ParticleSystem onDeathVfx2;
    #endregion

    #region Weaponry Properties
    [Header("Weaponry")]
    [SerializeField] private bool hasFlamethrower = false;
    [SerializeField] private GameObject topPart;
    [SerializeField] private GameObject cannon;
    [SerializeField] private GameObject projectilePrefab;
    [SerializeField] private Transform muzzlePoint;
    [SerializeField] private ParticleSystem flamethrowerEffect;
    [SerializeField] private float flamethrowerRange = 10f;
    [SerializeField] private float flamethrowerAngle = 45f;
    [SerializeField] bool isWallcracker;
    [SerializeField] float damageMultiplicator;
    [SerializeField] String[] multiplyDamageOfBuildingTag;
    #endregion

    public TurnManager turnManager;
    private List<GameObject> sortedGameObjects = new List<GameObject>();
    private Vector3 meshCenterLocal;


    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
    }
    private void Start()
    {
        CalculateMeshCenter();
        healthBar.UpdateHealthBar(health, maxHealth);
        SortGameObjectsByDistance();
        gameObjectToAttack = FindHighestPriorityInAttackRange();
    }
    void Update()
    {
        if (!isAlive) return;

        UpdateTarget();
        HandleAttackLogic();
        HandleRotationTowardsTarget();
    }

    private void UpdateTarget()
    {
        SortGameObjectsByDistance();
        gameObjectToAttack = FindHighestPriorityInAttackRange();

        if (gameObjectToAttack == null || !gameObjectToAttack.GetComponent<Building>().IsAlive())
        {
            isInAttackRange = false;
            if (flamethrowerEffect != null && flamethrowerEffect.isPlaying)
            {
                flamethrowerEffect.Stop();
            }
        }
        else
        {
            float distance = Vector3.Distance(transform.position, gameObjectToAttack.transform.position);
            isInAttackRange = distance <= attackRange;
        }
    }

    private void HandleAttackLogic()
    {
        if (!isInAttackRange)
        {
            if (flamethrowerEffect != null && flamethrowerEffect.isPlaying)
            {
                flamethrowerEffect.Stop();
            }
            return;
        }

        if (hasFlamethrower)
        {
            // If the enemy has a flamethrower, apply cone damage
            ApplyFlamethrowerDamage();

            // Activate the flamethrower effect
            if (flamethrowerEffect != null && !flamethrowerEffect.isPlaying)
            {
                flamethrowerEffect.Play();
            }
        }else if (isWallcracker)
        {
            Debug.Log("Starting wallcracker damage");
            if (!isDestroying)
            {
                isDestroying = true;
                StartCoroutine(wallCrackerDamage());
            }

        }
        else
        {
            // If the enemy doesn't have a flamethrower, use projectiles
            if (timeUntilNextShot <= 0f)
            {
                Shoot();
                timeUntilNextShot = secondsBetweenShots;
            }

            // Deactivate the flamethrower effect, if it's playing
            if (flamethrowerEffect != null && flamethrowerEffect.isPlaying)
            {
                flamethrowerEffect.Stop();
            }
        }

        timeUntilNextShot -= Time.deltaTime;
    }

    private void HandleRotationTowardsTarget()
    {
        if (!isInAttackRange) return;
        if (isWallcracker) return;
        Vector3 dir1 = gameObjectToAttack.transform.position - transform.position;
        Quaternion lookRotation1 = Quaternion.LookRotation(dir1);
        Vector3 rotation1 = Quaternion.Lerp(topPart.transform.rotation, lookRotation1, Time.deltaTime * turnSpeed).eulerAngles;
        topPart.transform.rotation = Quaternion.Euler(-90f, rotation1.y, 0f);

        float heightDifference = gameObjectToAttack.transform.position.y - cannon.transform.position.y;
        float horizontalDistance = Vector3.Distance(new Vector3(gameObjectToAttack.transform.position.x, cannon.transform.position.y, gameObjectToAttack.transform.position.z), cannon.transform.position);
        float pitchAngle = Mathf.Atan2(heightDifference, horizontalDistance) * Mathf.Rad2Deg;
        cannon.transform.localRotation = Quaternion.Euler(-pitchAngle, 0f, 0f);
    }

    public void Move(int direction)
    {
        transform.Translate(Vector3.forward * direction * speed * Time.deltaTime);
    }
    
    public void Rotate(int direction)
    {
        transform.Rotate(Vector3.up * direction * turnSpeed * Time.deltaTime);
    }
    
    public void TakeDamage(float amount, GameObject attacker)
    {
        underAttackBy = attacker;
        health -= amount;
        healthBar.UpdateHealthBar(health, maxHealth);

        if (health <= 0f)
        {
            Die();
        }
    }
    private IEnumerator ResetUnderAttackBy()
    {
        isResettingUnderAttackBy = true;
        yield return new WaitForSeconds(moveToAttackerTime);
        underAttackBy = null;
        isResettingUnderAttackBy = false;
    }

    void ApplyFlamethrowerDamage()
    {
        Collider[] colliders = Physics.OverlapSphere(muzzlePoint.position, flamethrowerRange);

        foreach (Collider collider in colliders)
        {
            // Überprüfen Sie, ob das Objekt innerhalb des Kegelwinkels liegt
            Vector3 directionToTarget = collider.transform.position - muzzlePoint.position;
            float angleToTarget = Vector3.Angle(muzzlePoint.forward, directionToTarget);

            if (angleToTarget < flamethrowerAngle / 2) // /2, da der Winkel in beide Richtungen vom Mittelpunkt aus geht
            {
                if (collider.tag != "Destroyed" && Enum.IsDefined(typeof(Building.BuildingType), collider.tag))
                {
                    Building building = collider.GetComponent<Building>();
                    if (building)
                    {
                        building.TakeDamage(damage * Time.deltaTime);
                    }
                }
            }
        }
    }

    IEnumerator wallCrackerDamage()
    {
        ParticleSystem psInst1 = Instantiate(onDeathVfx1, transform.position, transform.rotation);
        psInst1.transform.parent = this.transform;
        psInst1.Play();
        Destroy(psInst1.gameObject, psInst1.main.duration);
        yield return new WaitForSeconds(psInst1.main.duration);
        this.GetComponent<StupidTroopAIScript>().agent.isStopped = true;
        this.GetComponent<StupidTroopAIScript>().agent.speed = 0;
        // Deactivate the renderer after the first effect
        DisableAllRenderers();

        // Start the second effect
        ParticleSystem psInst2 = Instantiate(onDeathVfx2, transform.position, transform.rotation);
        psInst2.transform.parent = this.transform;
        psInst2.Play();
        Destroy(psInst2.gameObject, psInst2.main.duration);
        Debug.Log("Main Duration: " + psInst2.main.duration);

        Collider[] colliders = Physics.OverlapSphere(transform.position, attackRange);

        foreach (Collider collider in colliders)
        {
            if (!collider) continue;  

            Vector3 directionToTarget = collider.transform.position - transform.position;
            float distanceToTarget = directionToTarget.magnitude;

            if (collider.tag != "Destroyed" && Enum.IsDefined(typeof(Building.BuildingType), collider.tag))
            {

                Building building = collider.GetComponent<Building>();
                if (building && building.IsAlive()) 
                {
                    // Linear Damage reduction (interpolation)
                    float damageFactor = 1.0f - (distanceToTarget / attackRange);
                    float actualDamage = damage * damageFactor;

                    if (multiplyDamageOfBuildingTag.Contains(building.tag))
                    {
                        Debug.Log("1 Actual damage " + actualDamage + " GameObject: " + building.tag);
                        building.TakeDamage(actualDamage * damageMultiplicator);
                    }
                    else
                    {
                        Debug.Log("2 Actual damage " + actualDamage + " GameObject: " + building.tag);
                        building.TakeDamage(actualDamage);
                    }

                }
            }
        }
        yield return new WaitForSeconds(psInst2.main.duration);
        Die(false);
    }

    private void Die()
    {
        if (!isAlive)
            return;

        isAlive = false;
        if(turnManager != null)
            turnManager.EnemyKilled(this);

        this.tag = "Destroyed";

        if (onDeathVfx1 && onDeathVfx2)
        {
            StartCoroutine(HandleDeathEffects());
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Die(bool playVfx)
    {
        if (!isAlive)
            return;

        isAlive = false;
        turnManager.EnemyKilled(this);
        this.tag = "Destroyed";

        if (onDeathVfx1 && onDeathVfx2 && playVfx)
        {
            StartCoroutine(HandleDeathEffects());
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private IEnumerator HandleDeathEffects()
    {
        // Start the first effect
        ParticleSystem psInst1 = Instantiate(onDeathVfx1, transform.position, transform.rotation);
        psInst1.transform.parent = this.transform;
        psInst1.Play();
        Destroy(psInst1.gameObject, psInst1.main.duration);
        yield return new WaitForSeconds(psInst1.main.duration);

        // Deactivate the renderer after the first effect
        DisableAllRenderers();

        // Start the second effect
        ParticleSystem psInst2 = Instantiate(onDeathVfx2, transform.position, transform.rotation);
        psInst2.transform.parent = this.transform;
        psInst2.Play();
        Destroy(psInst2.gameObject, psInst2.main.duration);
        yield return new WaitForSeconds(psInst2.main.duration);

        // Finally, destroy the enemy object
        Destroy(gameObject);
    }
    private void DisableAllRenderers()
    {
        Renderer[] renderers = GetComponentsInChildren<Renderer>();
        foreach (Renderer rend in renderers)
        {
            rend.enabled = false;
        }
    }

    void Shoot()
    {
        Vector3 targetMeshCenter = gameObjectToAttack.GetComponent<Building>()?.GetMeshCenterInWorld() ?? gameObjectToAttack.transform.position;
        GameObject projectileGO = Instantiate(projectilePrefab, muzzlePoint.position, muzzlePoint.rotation);
        BulletScript projectile = projectileGO.GetComponent<BulletScript>();
        if (projectile != null)
        {
            projectile.Seek(gameObjectToAttack.transform, targetMeshCenter, this.gameObject);
        }
    }

    public GameObject getNearestObject() {
        if (underAttackBy && underAttackBy.GetComponent<Building>().IsAlive())
        {
            int attackerPrioIndex = GetPriorityIndex((Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), underAttackBy.tag));
            int currentTargetPrioIndex = GetPriorityIndex((Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), sortedGameObjects[0].tag));

            if (attackerPrioIndex < currentTargetPrioIndex) //low index means higher priorety
            {
                AlertNearbyUnits();
                if (isResettingUnderAttackBy)
                {
                    StopCoroutine(resetCoroutine);
                }
                resetCoroutine = StartCoroutine(ResetUnderAttackBy());
                return underAttackBy;
            }
            else
            {
                if (sortedGameObjects.Count > 0)
                {
                    return sortedGameObjects[0];
                }
                else
                {
                    return null;
                }
            }
        }
        
        if (sortedGameObjects.Count > 0 && sortedGameObjects[0].tag == neverMoveToPrio)
        {
            for (int i = 1; i < sortedGameObjects.Count; i++)
            {
                if (sortedGameObjects[i].tag != neverMoveToPrio)
                {
                    return sortedGameObjects[i];
                }
            }
        }

        if (sortedGameObjects.Count > 0)
        {
            return sortedGameObjects[0];
        }
        else
        {
            return null;
        }
    }

    private void SortGameObjectsByDistance()
    {
        sortedGameObjects.Clear();

        foreach (Building.BuildingType type in attackPrioList)
        {
            string tagToFind = type.ToString();
            GameObject[] foundObjects = GameObject.FindGameObjectsWithTag(tagToFind);

            sortedGameObjects.AddRange(foundObjects);
        }

        sortedGameObjects = sortedGameObjects.OrderBy(go => Vector3.Distance(transform.position, go.transform.position)).ToList();
    }
    private GameObject FindHighestPriorityInAttackRange()
    {
        GameObject highestPriorityObject = null;
        int highestPriorityIndex = -1;

        foreach (GameObject go in sortedGameObjects)
        {
            float distance = Vector3.Distance(transform.position, go.transform.position);
            if (distance <= attackRange)
            {
                Building.BuildingType objType = (Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), go.tag);
                int objPriorityIndex = GetPriorityIndex(objType);

                if (objPriorityIndex != -1 && (highestPriorityObject == null || objPriorityIndex < highestPriorityIndex))
                {
                    highestPriorityObject = go;
                    highestPriorityIndex = objPriorityIndex;
                }
            }
        }

        return highestPriorityObject;
    }

    private int GetPriorityIndex(Building.BuildingType type)
    {
        for (int i = 0; i < attackPrioList.Length; i++)
        {
            if (type == attackPrioList[i])
            {
                return i;
            }
        }
        return -1; 
    }

    public bool getIsInAttackRange()
    {

        return isInAttackRange;
    }
    private void AlertNearbyUnits()
    {
        // Find all enemy units in alertRange
        Collider[] enemiesInRange = Physics.OverlapSphere(transform.position, alertRadius);
        foreach (var enemyCollider in enemiesInRange)
        {
            // Check if the game object has the "Enemy" tag
            if (enemyCollider.CompareTag("Enemy"))
            {
                EnemyScript enemy = enemyCollider.GetComponent<EnemyScript>();
                if (enemy != null && enemy != this) // Avoid self-warning
                {
                    enemy.AlertFromOtherUnit(underAttackBy); // Informs other unity about attacker
                }
            }
        }
    }

    public void AlertFromOtherUnit(GameObject target)
    {
        if (target == null || target.tag == "Destroyed")
        {
            Debug.LogError("Received alert for a non-existing or destroyed building.");
            return;
        }

        if (!isWarned)
        {
            if (gameObjectToAttack == null)
            {
                isWarned = true;
                this.underAttackBy = target;
                StartCoroutine(ResetWarningAfterDuration());
                return;
            }
            else
            {
                if(target.CompareTag("Destroyed") || gameObjectToAttack.CompareTag("Destroyed"))
                {
                    return;
                }
                int attackerPrioIndex = GetPriorityIndex((Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), target.tag));
                int currentTargetPrioIndex = GetPriorityIndex((Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), gameObjectToAttack.tag));

                if (attackerPrioIndex < currentTargetPrioIndex) //low index means higher priority
                {
                    isWarned = true;
                    this.underAttackBy = target;
                    StartCoroutine(ResetWarningAfterDuration());
                }
            }
        }
    }


    private IEnumerator ResetWarningAfterDuration()
    {
        yield return new WaitForSeconds(alertDuration);
        isWarned = false;
        underAttackBy = null;
    }
    Vector3 GetMeshCenter(GameObject target)
    {
        MeshRenderer meshRenderer = target.GetComponent<MeshRenderer>();
        if (meshRenderer)
        {
            return meshRenderer.bounds.center;
        }
        return target.transform.position;
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
        return transform.TransformPoint(meshCenterLocal);
    }

    void DrawConeGizmo(Vector3 position, Vector3 direction, float angle, float range, Color color)
    {
        Gizmos.color = color;

        float halfAngle = angle / 2.0f;

        Vector3 line1 = Quaternion.LookRotation(direction) * Quaternion.Euler(0, halfAngle, 0) * Vector3.forward;
        Vector3 line2 = Quaternion.LookRotation(direction) * Quaternion.Euler(0, -halfAngle, 0) * Vector3.forward;

        Gizmos.DrawRay(position, line1 * range);
        Gizmos.DrawRay(position, line2 * range);
        Gizmos.DrawLine(position + line1 * range, position + line2 * range);
    }

    void OnDrawGizmos()
    {
        // Attackrange radius
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);

        // Alert Radius
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, alertRadius);

        // Flamethrower Cone
        DrawConeGizmo(muzzlePoint.position, muzzlePoint.forward, flamethrowerAngle, flamethrowerRange, Color.magenta);
    }
}
