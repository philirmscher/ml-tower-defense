using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class ObjectBtnManager : MonoBehaviour
{
    [SerializeField] private GameObject buttonPrefab;
    [SerializeField] private Transform buttonContainer;
    [SerializeField] private ObjectsDataBase objectsDataBase;
    [SerializeField] private PlacementSystem placementSystem;
    [SerializeField] private PointsManager pointsManager;

    private List<GameObject> buttonObjects = new List<GameObject>();

    private void Start()
    {
        GenerateButtons();
        InitializeButtonContainer();
        pointsManager.OnAvailabilityChanged += UpdateAvailability;
    }

    private void GenerateButtons()
    {
        for (int objectDataIndex = 0; objectDataIndex < objectsDataBase.objectsData.Count; objectDataIndex++)
        {
            ObjectsData objectData = objectsDataBase.objectsData[objectDataIndex];
            GameObject buttonObject = Instantiate(buttonPrefab, buttonContainer);
            buttonObject.transform.SetParent(buttonContainer, false); // Set the parent while preserving local position and scale
            TMP_Text buttonText = buttonObject.GetComponentInChildren<TMP_Text>();
            Image buttonImage = buttonObject.GetComponent<Image>();
            Button button = buttonObject.GetComponent<Button>();

            buttonText.text = pointsManager.GetAvailability(objectDataIndex).ToString();
            buttonImage.sprite = objectData.icon; // Set the button icon using the object's icon from ObjectData
            button.onClick.AddListener(() => placementSystem.StartPlacment(objectData.ID));

            buttonObjects.Add(buttonObject);
        }
    }
    private void InitializeButtonContainer()
    {
        // Add Horizontal Layout Group component to buttonContainer
        HorizontalLayoutGroup layoutGroup = buttonContainer.gameObject.AddComponent<HorizontalLayoutGroup>();
        layoutGroup.spacing = 10f; // Set the spacing between buttons

        // Set the child alignment to middle center (optional)
        layoutGroup.childAlignment = TextAnchor.MiddleCenter;

        // Disable forced expansion of child elements
        layoutGroup.childForceExpandWidth = false;
        layoutGroup.childForceExpandHeight = false;
        layoutGroup.childControlWidth = false;
        layoutGroup.childControlHeight = false;
    }

    private void UpdateAvailability()
    {
        // Update button availability text
        for (int i = 0; i < buttonObjects.Count; i++)
        {
            TMP_Text buttonText = buttonObjects[i].GetComponentInChildren<TMP_Text>();
            buttonText.text = pointsManager.GetAvailability(i).ToString();
        }
    }
}