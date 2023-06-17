using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class PointsUiManager : MonoBehaviour
{

    public TMP_Text pointsText;  // The Text UI element to be modified
    [SerializeField] private PointsManager pointsManager;

    // This function sets the text of the UI element
    public void SetText(string text)
    {
        pointsText.text = text;
    }

    public void UpdatePoints()
    {
        pointsText.text = pointsManager.GetCurrentPoints().ToString();
    }
    // Start is called before the first frame update
    void Start()
    {
        // Hier abonnieren wir das Ereignis "OnPointsChanged" im PointsManager
        pointsManager.OnPointsChanged += UpdatePoints;
        UpdatePoints();
    }

    // Update is called once per frame
    void Update()
    {
    }
}
