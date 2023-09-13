using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletScript : MonoBehaviour
{
    [SerializeField] public float speed = 70f;
    [SerializeField] public float explosionRadius = 0f;
    [SerializeField] public float damage = 50f;
    [SerializeField] private GameObject hit;
    [SerializeField] private GameObject flash;

    private Transform target;
    private string enemyTag = "Enemy";
    private Rigidbody rb;

    public void Seek(Transform target)
    {
        this.target = target;
    }

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        if (flash != null)
        {
            var flashInstance = Instantiate(flash, transform.position, Quaternion.identity); 
            flashInstance.transform.forward = target.position - transform.position; 
            var flashPs = flashInstance.GetComponent<ParticleSystem>();
            if (flashPs != null)
            {
                Destroy(flashInstance, flashPs.main.duration);
            }
            else
            {
                var flashPsParts = flashInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
                Destroy(flashInstance, flashPsParts.main.duration);
            }
        }
        Destroy(gameObject, 5);
    }

    void Update()
    {
        if (true)
        {
            if (target == null)
            {
                Destroy(gameObject);
                return;
            }
            
            Vector3 direction = target.position - transform.position;
            float distanceThisFrame = speed * Time.deltaTime;
            
            if (direction.magnitude <= distanceThisFrame)
            {
                HitTarget();
                return;
            }
            
            transform.Translate(direction.normalized * distanceThisFrame, Space.World);
            transform.LookAt(target);
        }
        else
        {
            Destroy(this);
        }
    }
    
    void HitTarget()
    {
        if (hit != null)
        {
            var hitInstance = Instantiate(hit, target.transform.position, target.transform.rotation);

            var hitPs = hitInstance.GetComponent<ParticleSystem>();
            if (hitPs != null)
            {
                Destroy(hitInstance, hitPs.main.duration);
            }
            else
            {
                var hitPsParts = hitInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
                Destroy(hitInstance, hitPsParts.main.duration);
            }
        }
        if (explosionRadius > 0f)
        {
            Explode();
        }
        else
        {
            Damage(target);
        }
        
        Destroy(gameObject);
    }
    
    void Explode()
    {
        Collider[] colliders = Physics.OverlapSphere(transform.position, explosionRadius);
        
        foreach (Collider collider in colliders)
        {
            if (collider.tag == enemyTag)
            {
                Damage(collider.transform);
            }
        }
    }
    
    void Damage(Transform enemy)
    {
        EnemyScript enemyScript = enemy.GetComponent<EnemyScript>();
        
        if (enemyScript != null)
        {
            enemyScript.TakeDamage(damage);
        }
    }

}
