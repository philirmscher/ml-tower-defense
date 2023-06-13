using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlacementSystem : MonoBehaviour
{
    [SerializeField] private GameObject mouseIndicator;
    [SerializeField] private InputManager inputManager;
    [SerializeField] private Grid worldGrid;
    [SerializeField] private ObjectsDataBase database;
    private int selectedObjectIndex = -1;
    [SerializeField] private GameObject gridVisualization;
    private WorldGridData defenseObjects;

    private List<GameObject> placedGameObjects = new();


    [SerializeField] private PreviewSystem preview;
    private Vector3Int lastDetectedPostion = Vector3Int.zero;
    private void Start()
    {
        StopPlacement();
        defenseObjects = new();
    }

    public void StartPlacment(int ID)
    {
        StopPlacement();
        selectedObjectIndex = database.objectsData.FindIndex(data => data.ID == ID);
        if(selectedObjectIndex < 0)
        {
            Debug.LogError($"No ID Found {ID}");
            return;
        }
        gridVisualization.SetActive(true);

        preview.StartShowingPlacementPreview(
            database.objectsData[selectedObjectIndex].Prefab,
            database.objectsData[selectedObjectIndex].Size);

        inputManager.OnClicked += PlaceStructure;
        inputManager.OnExit += StopPlacement;
    }

    private void PlaceStructure()
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);

        bool placementValidity = CheckPlacementValidity(worldGridPosition, selectedObjectIndex);
        if (placementValidity == false)
            return;

        GameObject newObject = Instantiate(database.objectsData[selectedObjectIndex].Prefab);
        newObject.transform.position = worldGrid.CellToWorld(worldGridPosition);

        placedGameObjects.Add(newObject);
        defenseObjects.AddObjectAt(
            worldGridPosition,
            database.objectsData[selectedObjectIndex].Size,
            database.objectsData[selectedObjectIndex].ID,
            placedGameObjects.Count - 1);

        preview.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), false);
    }

    private bool CheckPlacementValidity(Vector3Int worldGridPosition, int selectedObjectIndex)
    {
        return defenseObjects.CanPlaceObjectAt(worldGridPosition, database.objectsData[selectedObjectIndex].Size);
    }

    private void StopPlacement()
    {
        selectedObjectIndex = -1;
        gridVisualization.SetActive(false);
        preview.StopShowingPreview();
        inputManager.OnClicked -= PlaceStructure;
        inputManager.OnExit -= StopPlacement;
        lastDetectedPostion = Vector3Int.zero;
    }

    private void Update()
    {
        if (selectedObjectIndex < 0)
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);
        if(lastDetectedPostion != worldGridPosition)
        {
            bool placementValidity = CheckPlacementValidity(worldGridPosition, selectedObjectIndex);
            mouseIndicator.transform.position = mousePosition;
            preview.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), placementValidity);
            lastDetectedPostion = worldGridPosition;
        }
    }
}
