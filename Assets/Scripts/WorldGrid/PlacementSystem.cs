using System;
using UnityEngine;

public class PlacementSystem : MonoBehaviour
{
    [SerializeField] private InputManager inputManager;
    [SerializeField] private Grid worldGrid;
    [SerializeField] private ObjectsDataBase database;
    [SerializeField] private GameObject gridVisualization;
    [SerializeField] private ObjectPlacer objectPlacer;
    [SerializeField] private PointsManager pointsManager;
    [SerializeField] private PreviewSystem preview;

    private WorldGridData defenseObjects;
    private int databaseObjectIndex = -1;
    private int worldGridObjectIndex = -1;
    private Vector3Int lastDetectedPostion = Vector3Int.zero;

    private void Start()
    {
        StopPlacement();
        defenseObjects = new WorldGridData();
    }

    public void StartPlacment(int ID)
    {
        StopPlacement();
        gridVisualization.SetActive(true);
        SetupPlacementState(ID);
        inputManager.OnLeftClicked += SelectWorldGridLeftClick;
        inputManager.OnRightClicked += SelectWorldGridRightClick;
        inputManager.OnPressR += RotateStructure;
        inputManager.OnExit += StopPlacement;
    }

    private void SetupPlacementState(int id)
    {
        databaseObjectIndex = database.objectsData.FindIndex(data => data.ID == id);
        if (databaseObjectIndex > -1)
        {
            preview.StartShowingPlacementPreview(
                database.objectsData[databaseObjectIndex].Prefab,
                database.objectsData[databaseObjectIndex].Size
            );
        }
        else
        {
            throw new System.Exception($"No object with ID {id}");
        }
    }

    public void RotateStructure()
    {
        if (databaseObjectIndex == -1)
        {
            Debug.Log("No Object being Placed!");
            return;
        }

        ObjectsData selectedObject = database.objectsData[databaseObjectIndex];
        GameObject prefab = selectedObject.Prefab;
        Quaternion currentRotation = preview.GetPreviewRotation();
        Quaternion newRotation = Quaternion.Euler(0f, 90f, 0f) * currentRotation;

        if (preview != null)
            preview.RotatePreview(newRotation);
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
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);
        OnRightClicked(worldGridPosition);
    }

    public void StopPlacement()
    {
        preview.StopShowingPreview();
        gridVisualization.SetActive(false);
        inputManager.OnLeftClicked -= SelectWorldGridLeftClick;
        inputManager.OnRightClicked -= SelectWorldGridRightClick;
        inputManager.OnPressR -= RotateStructure;
        inputManager.OnExit -= StopPlacement;
        lastDetectedPostion = Vector3Int.zero;
    }

    private void Update()
    {
        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);
        if (lastDetectedPostion != worldGridPosition)
        {
            UpdatePlacementState(worldGridPosition);
            lastDetectedPostion = worldGridPosition;
        }
    }

    // Begin PlacementState functions
    private void OnLeftClicked(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition, databaseObjectIndex);
        if (placementValidity == false)
            return;

        bool isCornerWall = CheckForCornerWall(worldGridPosition, database.objectsData[databaseObjectIndex].Size);
        GameObject prefab = isCornerWall
            ? database.objectsData[databaseObjectIndex].cornerPrefab
            : database.objectsData[databaseObjectIndex].Prefab;

        preview.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), false);

        int index = objectPlacer.PlaceObject(prefab, preview.GetPreviewRotation(), preview.GetPreviewPosition());

        defenseObjects.AddObjectAt(
            worldGridPosition,
            database.objectsData[databaseObjectIndex].Size,
            database.objectsData[databaseObjectIndex].ID,
            index);

        pointsManager.PlaceObject(databaseObjectIndex);
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
            // You can choose to handle this scenario differently if needed
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
        preview.UpdatePosition(cellPosition, CheckIfSelectionIsValid(worldGridPosition));
    }

    private bool CheckPlacementValidity(Vector3Int worldGridPosition, int selectedObjectIndex)
    {
        return defenseObjects.CanPlaceObjectAt(worldGridPosition, database.objectsData[selectedObjectIndex].Size) &&
               pointsManager.CheckPlaceObject(selectedObjectIndex);
    }

    private bool CheckForCornerWall(Vector3Int position, Vector2Int objectSize)
    {
        return false; // You can modify this as needed
    }

    private void UpdatePlacementState(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition, databaseObjectIndex);
        preview.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), placementValidity);
    }

    private bool CheckIfSelectionIsValid(Vector3Int worldGridPosition)
    {
        return !defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one);
    }
    // End PlacementState functions
}
