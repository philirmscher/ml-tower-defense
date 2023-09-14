using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class EnemyScript : MonoBehaviour
{
    [SerializeField] private float speed = 10f;
    [SerializeField] private float turnSpeed = 10f;
    [SerializeField] private float health, maxHealth = 100f;
    [SerializeField] private float damage = 10f;
    [SerializeField] private float attackRange = 2f;
    [SerializeField] private float attackRate = 1f;
    [SerializeField] private Building.BuildingType[] attackPrioList;

    [SerializeField] private GameObject[] flashDamageMeshes;
    private Material[] originalMaterials;

    public Material damageMaterial;

    [SerializeField] private ParticleSystem onDeathVfx;

    [SerializeField] private HealthBar healthBar;

    private float attackCountdown = 0f;
    private List<GameObject> sortedGameObjects = new List<GameObject>();
    private GameObject gameObjectToAttack;
    private bool isInAttackRange = false;

    private GameObject underAttackBy;
    [SerializeField] private float moveToAttackerTime = 1;
    private bool isResettingUnderAttackBy = false;
    private Coroutine resetCoroutine;

    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
    }
    private void Start()
    {
        saveOriginalMaterials();
        healthBar.UpdateHealthBar(health, maxHealth);
        SortGameObjectsByDistance();
        gameObjectToAttack = FindHighestPriorityInAttackRange();
    }
    void Update()
    {
        SortGameObjectsByDistance();
        gameObjectToAttack = FindHighestPriorityInAttackRange();

        if (gameObjectToAttack == null)
        {
            if (sortedGameObjects.Count > 0)
            {
                isInAttackRange = false;
                return;
            }
            else
            {
                Debug.Log("No enemy to attack! " + this.gameObject);
                return;
            }
        }
        float distance;
        if (underAttackBy)
        {
            distance = Vector3.Distance(transform.position, underAttackBy.transform.position);
        }
        else
        {
            distance = Vector3.Distance(transform.position, gameObjectToAttack.transform.position);
        }
        

        if (distance <= attackRange)
        {
            isInAttackRange = true;
            if (attackCountdown <= 0f)
            {
                //Debug.Log("Attacking from Distanz: " + distance + " Attack Range is: " + attackRange);
                Attack(gameObjectToAttack);
                attackCountdown = 1f / attackRate;
            }

            attackCountdown -= Time.deltaTime;
        }
        else
        {
            //Debug.Log("Moving to: " + goToAttack + " Range is: " + distance);
            isInAttackRange = false;
        }
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
        StartCoroutine(FlashDamage());

        if (health <= 0f)
        {
            Die();
        }
    }
    private IEnumerator ResetUnderAttackBy()
    {
        Debug.Log("Start Coroutine");
        isResettingUnderAttackBy = true;
        yield return new WaitForSeconds(moveToAttackerTime);
        underAttackBy = null;
        isResettingUnderAttackBy = false;
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

    private void Die()
    {
        if (onDeathVfx) {   
        ParticleSystem vfxInst = Instantiate(onDeathVfx, transform.position, transform.rotation);

        Destroy(vfxInst, vfxInst.main.duration);
        Destroy(gameObject);

        }
    }
    
    
    void Attack(GameObject building)
    {
        var buildingScript = building.GetComponent<Building>();
        
        buildingScript.TakeDamage(damage);
    }

    public GameObject getNearestObject() {
        if (underAttackBy && underAttackBy.GetComponent<Building>().IsAlive())
        {
            int attackerPrioIndex = GetPriorityIndex((Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), underAttackBy.tag));
            int currentTargetPrioIndex = GetPriorityIndex((Building.BuildingType)Enum.Parse(typeof(Building.BuildingType), sortedGameObjects[0].tag));

            if (attackerPrioIndex < currentTargetPrioIndex) //low index means higher priorety
            {
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
        return -1; // Rückgabe -1, wenn der Typ nicht in der Prioritätsliste ist.
    }

    public bool getIsInAttackRange()
    {

        return isInAttackRange;
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);
    }
}
