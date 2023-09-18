using System;
using UnityEngine;
using System.Collections.Generic;
public class PlacementSystem : MonoBehaviour
{
    [SerializeField] private InputManager inputManager;
    [SerializeField] private Grid worldGrid;
    [SerializeField] private ObjectsDataBase database;
    [SerializeField] private GameObject gridVisualization;
    [SerializeField] private ObjectPlacer objectPlacer;
    [SerializeField] private PointsManager pointsManager;
    [SerializeField] private PreviewSystem previewSystem;

    private WorldGridData defenseObjects;
    private int objectDatabaseId = -1;
    private int worldGridObjectIndex = -1;
    private Vector3Int lastDetectedPostion = Vector3Int.zero;
    private bool wallLinePlacement = false;
    private bool isPlacingWallLine = false;
    private Vector3Int startGridPosition;
    private Vector3Int mouseGridPosition;
    private void Start()
    {
        StopPlacement();
        defenseObjects = new WorldGridData();
    }

    public void StartPlacment(int id)
    {
        StopPlacement();
        gridVisualization.SetActive(true);
        SetupPlacementState(id);
        if (getBuildingNameById(id) == "Wall")
        {
            wallLinePlacement = true;
            inputManager.OnLeftClickedDown += StartWallLinePlacement;
            inputManager.OnLeftClickedUp += EndWallLinePlacement;
        }
        else
        {
            wallLinePlacement = false;
            inputManager.OnLeftClickedUp += SelectWorldGridLeftClick;
        }

        inputManager.OnRightClicked += SelectWorldGridRightClick;
        inputManager.OnPressR += RotateStructure;
        inputManager.OnExit += StopPlacement;
    }

    private void SetupPlacementState(int id)
    {
        this.objectDatabaseId = id;
        if (objectDatabaseId > -1)
        {
            previewSystem.StartShowingPlacementPreview(
                database.objectsData[id].Prefab,
                database.objectsData[id].Size
            );
        }
        else
        {
            throw new System.Exception($"No object with ID {id}");
        }
    }

    public void RotateStructure()
    {
        if (objectDatabaseId == -1)
        {
            Debug.Log("No Object being Placed!");
            return;
        }

        ObjectsData selectedObject = database.objectsData[objectDatabaseId];
        GameObject prefab = selectedObject.Prefab;
        Quaternion currentRotation = previewSystem.GetPreviewRotation();
        Quaternion newRotation = Quaternion.Euler(0f, 90f, 0f) * currentRotation;

        if (previewSystem != null)
            previewSystem.RotatePreview(newRotation);
    }

    private void SelectWorldGridLeftClick()
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);
        OnLeftClicked(worldGridPosition);
    }

    private void SelectWorldGridRightClick()
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        mouseGridPosition = worldGrid.WorldToCell(mousePosition);
        OnRightClicked(mouseGridPosition);
    }

    public void StopPlacement()
    {
        previewSystem.StopShowingPreview();
        gridVisualization.SetActive(false);

        if (wallLinePlacement)
        {
            inputManager.OnLeftClickedDown -= StartWallLinePlacement;
            inputManager.OnLeftClickedUp -= EndWallLinePlacement;
        }

        inputManager.OnLeftClickedUp -= SelectWorldGridLeftClick;
        inputManager.OnRightClicked -= SelectWorldGridRightClick;
        inputManager.OnPressR -= RotateStructure;
        inputManager.OnExit -= StopPlacement;
        lastDetectedPostion = Vector3Int.zero;
    }

    private void Update()
    {
        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        mouseGridPosition = worldGrid.WorldToCell(mousePosition);

        if (!wallLinePlacement)
        {
            if (lastDetectedPostion != mouseGridPosition)
            {
                UpdateSingleObjectPlacement(mouseGridPosition);
                lastDetectedPostion = mouseGridPosition;
            }
        }
        else
        {
            UpdateWallLinePlacment();
        }
    }





    private void OnRightClicked(Vector3Int worldGridPosition)
    {
        WorldGridData selectedData = null;
        if (!defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one))
        {
            selectedData = defenseObjects;
        }

        if (selectedData == null)
        {
            Debug.Log("No selected data found.");
            return;
        }

        worldGridObjectIndex = selectedData.GetRepresentationIndex(worldGridPosition);
        if (worldGridObjectIndex == -1)
            return;

        pointsManager.RemoveObject(database.objectsData.FindIndex(data => data.ID == selectedData.GetIDAt(worldGridPosition)));
        selectedData.RemoveObjectAt(worldGridPosition);
        objectPlacer.RemoveObjectAt(worldGridObjectIndex);

        Vector3 cellPosition = worldGrid.CellToWorld(worldGridPosition);
        previewSystem.UpdatePosition(cellPosition, cellPosition, CheckIfSelectionIsValid(worldGridPosition));
    }

    private bool CheckPlacementValidity(Vector3Int startGridPosition, Vector3Int endGridPosition, int selectedObjectIndex)
    {
        Vector2Int objectSize = database.objectsData[selectedObjectIndex].Size;

        int xDiff = Mathf.Abs(endGridPosition.x - startGridPosition.x);
        int zDiff = Mathf.Abs(endGridPosition.z - startGridPosition.z);
        int stepX = (endGridPosition.x >= startGridPosition.x) ? 1 : -1;
        int stepZ = (endGridPosition.z >= startGridPosition.z) ? 1 : -1;


        bool isAlongXAxis = xDiff > zDiff;
        int steps = isAlongXAxis ? xDiff / objectSize.x : zDiff / objectSize.y;

        if (!pointsManager.CanPlaceMultipleObjects(selectedObjectIndex, steps + 1))
            return false;

        for (int i = 0; i <= steps; i++)
        {
            Vector3Int currentGridPosition = isAlongXAxis
                ? new Vector3Int(startGridPosition.x + i * stepX * objectSize.x, startGridPosition.y, startGridPosition.z)
                : new Vector3Int(startGridPosition.x, startGridPosition.y, startGridPosition.z + i * stepZ * objectSize.y);

            if (!defenseObjects.CanPlaceObjectAt(currentGridPosition, objectSize))
                return false;
        }

        return true;
    }


    private void UpdateSingleObjectPlacement(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition,worldGridPosition, objectDatabaseId);
        previewSystem.UpdatePosition(mouseGridPosition,mouseGridPosition, placementValidity);
    }

    private bool CheckIfSelectionIsValid(Vector3Int worldGridPosition)
    {
        return !defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one);
    }

    private String getBuildingNameById(int id)
    {
        return database.objectsData[id].Name;
    }
    private void StartWallLinePlacement()
    {
        if (inputManager.IsPointerOverUI())
            return;
        startGridPosition = mouseGridPosition;
        isPlacingWallLine = true;
    }
    private void UpdateWallLinePlacment()
    {

        if (inputManager.IsPointerOverUI())
            return;

        if (isPlacingWallLine)
        {
            previewSystem.UpdatePosition(startGridPosition, mouseGridPosition, CheckPlacementValidity(startGridPosition, mouseGridPosition, objectDatabaseId));
        }
        else
        {
            UpdateSingleObjectPlacement(mouseGridPosition);
        }
    }

    private void EndWallLinePlacement()
    {

        if (inputManager.IsPointerOverUI())
            return;

        isPlacingWallLine = false;
        if (CheckPlacementValidity(startGridPosition, mouseGridPosition, objectDatabaseId))
        {
            List<Vector3Int> previewGridPositions = previewSystem.GetPreviewGridPositions();
            GameObject prefab = database.objectsData[objectDatabaseId].Prefab;

            foreach (Vector3Int gridPos in previewGridPositions)
            {
                int index = objectPlacer.PlaceObject(prefab, previewSystem.GetPreviewRotation(), gridPos);

                defenseObjects.AddObjectAt(previewSystem.OffsetPreviewOnGrid(gridPos, -database.objectsData[objectDatabaseId].Size), database.objectsData[objectDatabaseId].Size, database.objectsData[objectDatabaseId].ID, index);
                pointsManager.PlaceObject(objectDatabaseId);
            }
        }

        isPlacingWallLine = false;
        previewSystem.UpdatePosition(mouseGridPosition, mouseGridPosition, CheckPlacementValidity(mouseGridPosition, mouseGridPosition, objectDatabaseId));
    }
    private void OnLeftClicked(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition, worldGridPosition, objectDatabaseId);
        if (placementValidity == false)
            return;

        GameObject prefab = database.objectsData[objectDatabaseId].Prefab;

        previewSystem.UpdatePosition(mouseGridPosition, mouseGridPosition, false);

        int index = objectPlacer.PlaceObject(prefab, previewSystem.GetPreviewRotation(), previewSystem.GetPreviewPosition());

        defenseObjects.AddObjectAt(
            worldGridPosition,
            database.objectsData[objectDatabaseId].Size,
            database.objectsData[objectDatabaseId].ID,
            index);

        pointsManager.PlaceObject(objectDatabaseId);
    }

}
