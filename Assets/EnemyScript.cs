using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyScript : MonoBehaviour
{
    public float speed = 10f;
    public float health = 100f;
    public float damage = 10f;
    
    public float horizontal = 0f;
    public float vertical = 0f;
    
    public void TakeDamage(float amount)
    {
        health -= amount;
        
        if (health <= 0f)
        {
            Die();
        }
    }
    
    void Die()
    {
        Destroy(gameObject);
    }
    
    void Update()
    {
        if (true)
        {
            //do something
        }
        else
        {
            Destroy(this);
        }
    }
    
    void FixedUpdate()
    {
        
        Vector3 movement = new Vector3(horizontal, 0f, vertical);
        transform.Translate(movement * speed * Time.deltaTime, Space.World);
    }
}
