using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThirdPersonController : MonoBehaviour
{
    Camera cam;
    
    public float camXOffset = 0f;
    public float camYOffset = 10f;
    public float camZOffset = -10f;
    public float camLookAtYOffset = 2f;
    
    void Start()
    {
        cam = Camera.main;
    }
    
    void Update()
    {
        var enemyScript = GetComponent<EnemyScript>();
        
        var horizontal = Input.GetAxis("Horizontal");
        var vertical = Input.GetAxis("Vertical");
        
        enemyScript.Move((int)vertical);
        enemyScript.Rotate((int)horizontal);
        
        //move the camera to the player and offset it and rotate with the player
        cam.transform.position = transform.position + new Vector3(camXOffset, camYOffset, camZOffset);

        //look at the player but a bit higher
        cam.transform.LookAt(transform.position + new Vector3(0f, camLookAtYOffset, 0f));
    }
}
