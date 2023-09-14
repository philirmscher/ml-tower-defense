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

    [SerializeField] private HealthBar healthBar;

    private float attackCountdown = 0f;
    private List<GameObject> sortedGameObjects = new List<GameObject>();
    private GameObject goToAttack;

    private void Awake()
    {
        healthBar = GetComponentInChildren<HealthBar>();
    }
    private void Start()
    {
        saveOriginalMaterials();
        healthBar.UpdateHealthBar(health, maxHealth);
        SortGameObjectsByDistance();
        goToAttack = FindHighestPriorityInAttackRange();
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
        SortGameObjectsByDistance();
        goToAttack = FindHighestPriorityInAttackRange();

        if (goToAttack == null)
            return;
        
        var distance = Vector3.Distance(transform.position, goToAttack.transform.position);
            
        if (distance <= attackRange)
        {
            if (attackCountdown <= 0f)
            {
                Attack(goToAttack);
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

    public GameObject getNearestObject() {
        if (sortedGameObjects.Count > 0)
        {
            return sortedGameObjects[0];
        }
        else
        {
            return null; // Oder eine geeignete Alternative, wenn die Liste leer ist.
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

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);
    }
}
