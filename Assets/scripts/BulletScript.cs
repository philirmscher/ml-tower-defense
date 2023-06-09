using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletScript : MonoBehaviour
{
    public float speed = 70f;
    public float explosionRadius = 0f;
    public float damage = 50f;

    private Transform target;
    private string enemyTag = "Enemy";

    public void Seek(Transform _target)
    {
        target = _target;
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
