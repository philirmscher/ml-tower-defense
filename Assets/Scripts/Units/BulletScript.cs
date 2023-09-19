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

    [Header("Wall Interaction")]
    [SerializeField] private bool cantShootThroughWalls = false;
    private string wallTag = "Wall";

    private Transform target;
    private string enemyTag = "Enemy";
    private Rigidbody rb;
    private GameObject projectileOrigin;
    private Vector3 startPos;
    private Vector3 targetStartPosition;
    private float Animation;

    private Vector3 targetPoint;

    public void Seek(Transform _target, GameObject projectileOrigin)
    {
        this.target = _target;
        this.targetPoint = _target.position;
        this.projectileOrigin = projectileOrigin;
    }

    public void Seek(Transform _target, Vector3 targetMesh, GameObject projectileOrigin)
    {
        this.target = _target;
        this.targetPoint = targetMesh;
        this.projectileOrigin = projectileOrigin;
    }

    private void parabola()
    {
        Animation += Time.deltaTime;
        Animation = Animation % 5;

        transform.position = MathParabola.Parabola(startPos, targetStartPosition, mortarProjectileHeight, Animation / 2);
    }
    public Vector3 GetFirstParabolaPoint()
    {
        return MathParabola.Parabola(startPos, targetStartPosition, mortarProjectileHeight, 0.01f);
    }

    void Start()
    {
        startPos = transform.position;
        if (target != null)
        {
            targetStartPosition = target.position;

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
        }
        rb = GetComponent<Rigidbody>();
        Destroy(gameObject, 5);
    }

    void Update()
    {
        if (target == null)
        {
            Debug.Log("Projektil zerstört wegen fehlendem Ziel.");
            Destroy(gameObject);
            return;
        }

        if (cantShootThroughWalls)
        {
            RaycastHit hit;
            if (Physics.Raycast(transform.position, targetPoint - transform.position, out hit))
            {
                if (hit.collider.tag == wallTag)
                {
                    target = hit.transform;
                    HitTarget(hit.point, Quaternion.identity);
                    return;
                }
            }
        }

        if (isMortarProjectile)
        {
            parabola();
            float distanceToTarget = Vector2.Distance(new Vector2(transform.position.x, transform.position.z), new Vector2(targetStartPosition.x, targetStartPosition.z));
            if (distanceToTarget < 0.1f)
            {
                HitTarget(targetStartPosition, Quaternion.identity);
                return;
            }
        }
        else
        {
            if (targetPoint == Vector3.zero)
            {
                Destroy(gameObject);
                return;
            }

            Vector3 direction = targetPoint - transform.position;
            float distanceThisFrame = speed * Time.deltaTime;

            if (direction.magnitude <= distanceThisFrame)
            {
                HitTarget(targetPoint, Quaternion.identity); // Hier verwenden wir targetPoint statt target.position
                return;
            }

            transform.Translate(direction.normalized * distanceThisFrame, Space.World);
            transform.LookAt(targetPoint); // Auch hier verwenden wir targetPoint statt target
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

    void Damage(Transform hitTarget)
    {
        EnemyScript enemyScript = hitTarget.GetComponent<EnemyScript>();
        if (enemyScript != null)
        {
            enemyScript.TakeDamage(damage, projectileOrigin);
            return;
        }

        Building buildingScript = hitTarget.GetComponent<Building>();
        if (buildingScript != null)
        {
            buildingScript.TakeDamage(damage);
        }
    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject == target.gameObject && collision.contacts.Length > 0)
        {
            Vector3 explosionPoint = collision.contacts[0].point;
            HitTarget(explosionPoint, Quaternion.identity);
        }
    }

}
