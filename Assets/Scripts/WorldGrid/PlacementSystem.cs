using System;
using UnityEngine;
using System.Collections.Generic;

public class PlacementSystem : MonoBehaviour
{
    //Properties
    [SerializeField] private InputManager inputManager;
    [SerializeField] private Grid worldGrid;
    [SerializeField] private ObjectsDataBase database;
    [SerializeField] private GameObject gridVisualization;
    [SerializeField] private ObjectPlacer objectPlacer;
    [SerializeField] private PointsManager pointsManager;
    [SerializeField] private PreviewSystem previewSystem;
    [SerializeField] private Material deletionMaterial; // Transparent red material for deletion area

    private WorldGridData defenseObjects;
    private int objectDatabaseId = -1;
    private int worldGridObjectIndex = -1;
    private Vector3Int lastDetectedPostion = Vector3Int.zero;
    private bool wallLinePlacement = false;
    private bool isPlacingWallLine = false;
    private Vector3Int startGridPosition;
    private Vector3Int mouseGridPosition;
    private bool isInDeletionMode = false;
    private Vector3Int initialDeletePosition;
    private GameObject deletionArea;

    // 2. Unity Methodes
    private void Start()
    {
        StopPlacement();
        defenseObjects = new WorldGridData();
        initDeletionArea();
    }

    private void Update()
    {
        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        mouseGridPosition = worldGrid.WorldToCell(mousePosition);

        if (isInDeletionMode)
        {
            UpdateDeletionArea(mouseGridPosition);
        }

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

    //Placment Methods
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

        inputManager.OnRightMouseDown += SelectWorldGridRightClick;
        inputManager.OnRightMouseUp += SelectWorldGridRightClick;
        inputManager.OnPressR += RotateStructure;
        inputManager.OnExit += StopPlacement;
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
        inputManager.OnRightMouseDown -= SelectWorldGridRightClick;
        inputManager.OnRightMouseUp -= SelectWorldGridRightClick;
        inputManager.OnPressR -= RotateStructure;
        inputManager.OnExit -= StopPlacement;
        lastDetectedPostion = Vector3Int.zero;
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

    private void SelectWorldGridLeftClick()
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);
        OnLeftClicked(worldGridPosition);
    }

    private void UpdateSingleObjectPlacement(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition, worldGridPosition, objectDatabaseId);
        previewSystem.UpdatePosition(mouseGridPosition, mouseGridPosition, placementValidity);
    }

    //Private Assistfunctions
    void initDeletionArea()
    {
        deletionArea = new GameObject("DeletionArea");
        deletionArea.AddComponent<MeshRenderer>().material = deletionMaterial;
        deletionArea.AddComponent<MeshFilter>().mesh = CreateQuadMesh();
        deletionArea.SetActive(false);
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

    // Deletion
    private void SelectWorldGridRightClick()
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        mouseGridPosition = worldGrid.WorldToCell(mousePosition);
        if (!isInDeletionMode)
        {
            StartDeletionMode(mouseGridPosition);
        }
        else
        {
            EndDeletionMode(mouseGridPosition);
        }
    }

    private void StartDeletionMode(Vector3Int position)
    {
        isInDeletionMode = true;
        initialDeletePosition = position;
        deletionArea.SetActive(true);
    }

    private void UpdateDeletionArea(Vector3Int currentPos)
    {
        if (isInDeletionMode)
        {
            Vector3Int pivotCorner = initialDeletePosition;
            Vector3Int oppositeCorner = currentPos;

            bool moveRight = currentPos.x >= initialDeletePosition.x;
            bool moveUp = currentPos.z >= initialDeletePosition.z;

            if (!moveRight)
            {
                pivotCorner.x = currentPos.x;
                oppositeCorner.x = initialDeletePosition.x;
            }
            if (!moveUp)
            {
                pivotCorner.z = currentPos.z;
                oppositeCorner.z = initialDeletePosition.z;
            }
            Vector3 scale = new Vector3(
                Mathf.Abs(pivotCorner.x - oppositeCorner.x) + 1,
                0.1f,
                Mathf.Abs(pivotCorner.z - oppositeCorner.z) + 1
            );

            Vector3 worldPos = worldGrid.CellToWorld(pivotCorner);
            deletionArea.transform.position = worldPos + new Vector3(0, 0.05f, 0);
            deletionArea.transform.localScale = scale;
        }
    }

    private void EndDeletionMode(Vector3Int endPosition)
    {
        isInDeletionMode = false;
        DeleteObjectsInArea(initialDeletePosition, endPosition);
        deletionArea.SetActive(false);
    }

    private void DeleteObjectsInArea(Vector3Int startPos, Vector3Int endPos)
    {
        // Loop through the area and delete objects
        for (int x = Mathf.Min(startPos.x, endPos.x); x <= Mathf.Max(startPos.x, endPos.x); x++)
        {
            for (int z = Mathf.Min(startPos.z, endPos.z); z <= Mathf.Max(startPos.z, endPos.z); z++)
            {
                Vector3Int pos = new Vector3Int(x, 0, z);
                OnRightClicked(pos);
            }
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
            return;

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

    private bool CheckIfSelectionIsValid(Vector3Int worldGridPosition)
    {
        return !defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one);
    }

    private String getBuildingNameById(int id)
    {
        return database.objectsData[id].Name;
    }

    Mesh CreateQuadMesh()
    {
        Mesh mesh = new Mesh();

        Vector3[] vertices = {
        new Vector3(0, 0, 0),
        new Vector3(1, 0, 0),
        new Vector3(0, 0, 1),
        new Vector3(1, 0, 1)
    };

        int[] triangles = {
        0, 2, 1,
        2, 3, 1
    };

        mesh.vertices = vertices;
        mesh.triangles = triangles;
        mesh.RecalculateNormals();

        return mesh;
    }
}
