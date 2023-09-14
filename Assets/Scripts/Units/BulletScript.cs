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
    [SerializeField] private bool isMortarProjectile = false;
    [SerializeField] private float mortarProjectileHeight = 10;

    private Transform target;
    private string enemyTag = "Enemy";
    private Rigidbody rb;
    private GameObject projectileOrigin;
    private Vector3 startPos;
    private Vector3 targetStartPosition;
    private float Animation;

    public void Seek(Transform target, GameObject projectileOrigin)
    {
        this.target = target;
        this.projectileOrigin = projectileOrigin;
    }

    private void parabola()
    {
        Animation += Time.deltaTime;
        Animation = Animation % 5;

        transform.position = MathParabola.Parabola(startPos, targetStartPosition, mortarProjectileHeight, Animation / 2);
        Debug.Log(transform.position);
    }
    public Vector3 GetFirstParabolaPoint()
    {
        return MathParabola.Parabola(startPos, targetStartPosition, mortarProjectileHeight, 0.01f);
    }

    void Start()
    {
        startPos = transform.position;
        targetStartPosition = target.position;
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
        if (target == null)
        {
            Destroy(gameObject);
            return;
        }

        if (isMortarProjectile)
        {
            parabola();
            float distanceToTarget = Vector3.Distance(transform.position, targetStartPosition);
            if (distanceToTarget < 0.1f)
            {
                HitTarget(targetStartPosition,Quaternion.identity);
                return;
            }
        }
        else
        {
            Vector3 direction = target.position - transform.position;
            float distanceThisFrame = speed * Time.deltaTime;

            if (direction.magnitude <= distanceThisFrame)
            {
                HitTarget(target.position,target.rotation);
                return;
            }

            transform.Translate(direction.normalized * distanceThisFrame, Space.World);
            transform.LookAt(target);
        }
    }


    
    void HitTarget(Vector3 targetPos,Quaternion targetRot)
    {
        if (hit != null)
        {
            var hitInstance = Instantiate(hit, targetPos, targetRot);

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
            enemyScript.TakeDamage(damage,projectileOrigin);
        }
    }

}
