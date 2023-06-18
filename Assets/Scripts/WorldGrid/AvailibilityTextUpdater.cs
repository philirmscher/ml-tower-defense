using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class AvailibilityTextUpdater : MonoBehaviour
{
    [SerializeField] private int objectDataIndex;  // Der Index, der das Verhalten des Textobjekts steuert
    [SerializeField] private PointsManager pointsManager;
    private TextMeshProUGUI textComponent;  // Das Textobjekt

    private void Awake()
    {
        textComponent = GetComponent<TextMeshProUGUI>();  // Das TMP_Text-Komponente des Objekts finden
    }

    private void Start()
    {
        pointsManager.OnAvailabilityChanged += UpdateText;
        UpdateText();  // Initialisieren des Texts basierend auf dem Indexwert
    }

    public void UpdateText()
    {
        string newText = pointsManager.GetAvailability(objectDataIndex).ToString();
        textComponent.text = newText;
    }
}