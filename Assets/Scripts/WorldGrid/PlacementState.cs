using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlacementState : IDefenseObjectsState
{
    private int databaseObjectIndex = -1;
    int ID;
    Grid worldGrid;
    PreviewSystem previewSystem;
    ObjectsDataBase database;
    ObjectPlacer objectPlacer;
    WorldGridData defenseObjects;

    public PlacementState(
        int id,
        Grid worldGrid,
        PreviewSystem previewSystem,
        ObjectsDataBase database,
        ObjectPlacer objectPlacer,
        WorldGridData defenseObjects)
    {
        ID = id;
        this.worldGrid = worldGrid;
        this.previewSystem = previewSystem;
        this.database = database;
        this.objectPlacer = objectPlacer;
        this.defenseObjects = defenseObjects;

        databaseObjectIndex = database.objectsData.FindIndex(data => data.ID == ID);
        if (databaseObjectIndex > -1)
        {
            previewSystem.StartShowingPlacementPreview(
                database.objectsData[databaseObjectIndex].Prefab,
                database.objectsData[databaseObjectIndex].Size
            );
        }
        else
            throw new System.Exception($"No object with ID {id}");

    }

    public void EndState()
    {
        previewSystem.StopShowingPreview();
    }

    public void OnAction(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition, databaseObjectIndex);
        if (placementValidity == false)
            return;

        bool isCornerWall = CheckForCornerWall(worldGridPosition, database.objectsData[databaseObjectIndex].Size);
        GameObject prefab = isCornerWall
            ? database.objectsData[databaseObjectIndex].cornerPrefab
            : database.objectsData[databaseObjectIndex].Prefab;

        int index = objectPlacer.PlaceObject(prefab, previewSystem.GetPreviewRotation(), previewSystem.GetPreviewPosition());

        defenseObjects.AddObjectAt(
            worldGridPosition,
            database.objectsData[databaseObjectIndex].Size,
            database.objectsData[databaseObjectIndex].ID,
            index);

        previewSystem.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), false);
    }
    public void RotateObject(float angle)
    {
        if (databaseObjectIndex == -1)
            return;

        ObjectsData selectedObject = database.objectsData[databaseObjectIndex];

        // Rotate the prefab of the selected object
        GameObject prefab = selectedObject.Prefab;
        Quaternion currentRotation = previewSystem.GetPreviewRotation();
        Quaternion newRotation = Quaternion.Euler(0f, angle, 0f) * currentRotation;

        // Rotate the preview object
        if (previewSystem != null)
            previewSystem.RotatePreview(newRotation);

        Debug.Log($"Rotation: {newRotation.eulerAngles}");
    }
    private bool CheckPlacementValidity(Vector3Int worldGridPosition, int selectedObjectIndex)
    {
        return defenseObjects.CanPlaceObjectAt(worldGridPosition, database.objectsData[selectedObjectIndex].Size);
    }

    private bool CheckForCornerWall(Vector3Int position, Vector2Int objectSize)
    {
        return false;
    }

    public void UpdateState(Vector3Int worldGridPosition)
    {
        bool placementValidity = CheckPlacementValidity(worldGridPosition, databaseObjectIndex);
        previewSystem.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), placementValidity);
    }

}
