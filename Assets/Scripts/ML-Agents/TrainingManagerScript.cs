using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrainingManagerScript : MonoBehaviour
{
    [SerializeField] private GameObject trainingGround;
    [Header("Amount of training grounds")]
    [SerializeField][Range(1, 100)] private int amount = 1;
    [Header("Speed of the training (Updated live)")]
    [SerializeField] [Range(1, 10)] private float speed = 1;
    
    private void Start()
    {
        for (int i = 1; i < amount; i++)
        {
            Instantiate(trainingGround, new Vector3(i * 110, 0, 0), Quaternion.identity);
        }
        
        Time.timeScale = speed;
    }
    
    private void Update()
    {
        Time.timeScale = speed;
    }
}
