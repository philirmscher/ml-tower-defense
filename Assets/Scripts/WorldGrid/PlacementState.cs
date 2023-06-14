using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlacementState : IDefenseObjectsState
{
    private int selectedObjectIndex = -1;
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

        selectedObjectIndex = database.objectsData.FindIndex(data => data.ID == ID);
        if (selectedObjectIndex > -1)
        {
            previewSystem.StartShowingPlacementPreview(
                database.objectsData[selectedObjectIndex].Prefab,
                database.objectsData[selectedObjectIndex].Size
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
        bool placementValidity = CheckPlacementValidity(worldGridPosition, selectedObjectIndex);
        if (placementValidity == false)
            return;

        bool isCornerWall = CheckForCornerWall(worldGridPosition, database.objectsData[selectedObjectIndex].Size);
        GameObject prefab = isCornerWall
            ? database.objectsData[selectedObjectIndex].cornerPrefab
            : database.objectsData[selectedObjectIndex].Prefab;

        int index = objectPlacer.PlaceObject(prefab, worldGrid.CellToWorld(worldGridPosition));


        defenseObjects.AddObjectAt(
            worldGridPosition,
            database.objectsData[selectedObjectIndex].Size,
            database.objectsData[selectedObjectIndex].ID,
            index);

        previewSystem.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), false);
    }
    public void RotateObject(float angle)
    {
        if (selectedObjectIndex == -1)
            return;

        ObjectsData selectedObject = database.objectsData[selectedObjectIndex];

        // Rotate the prefab of the selected object
        GameObject prefab = selectedObject.Prefab;
        Quaternion currentRotation = prefab.transform.rotation;
        Quaternion newRotation = Quaternion.Euler(0f, angle, 0f) * currentRotation;
        prefab.transform.rotation = newRotation;

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
        bool placementValidity = CheckPlacementValidity(worldGridPosition, selectedObjectIndex);
        previewSystem.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), placementValidity);
    }
}
