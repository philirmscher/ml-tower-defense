using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TurnManager : MonoBehaviour
{
    [SerializeField] private GameObject gridSystem;
    [SerializeField] private GameObject placementUI;
    
    public void StartTurn()
    {
        placementUI.SetActive(false);
        gridSystem.SetActive(false);
    }

}
