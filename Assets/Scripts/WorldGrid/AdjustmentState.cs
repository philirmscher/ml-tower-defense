using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AdjustmentState : IDefenseObjectsState
{
    private int worldGridObjectIndex = -1;
    private int databaseObjectIndex = -1;
    private bool hasObjectSelected = false;
    private Vector2Int objectGridSize;
    private int objectWorldGridID = -1;
    Grid worldGrid;
    PreviewSystem previewSystem;
    ObjectPlacer objectPlacer;
    WorldGridData defenseObjects;
    ObjectsDataBase database;
    public AdjustmentState(Grid worldGrid,
                           PreviewSystem previewSystem,
                           ObjectPlacer objectPlacer,
                           WorldGridData defenseObjects,
                           ObjectsDataBase database)
    {
        this.worldGrid = worldGrid;
        this.previewSystem = previewSystem;
        this.objectPlacer = objectPlacer;
        this.defenseObjects = defenseObjects;
        this.database = database;

        previewSystem.StartShowingRemovePreview();
    }
    public void EndState()
    {
        previewSystem.StopShowingPreview();
    }

    public void OnAction(Vector3Int worldGridPosition)
    {
        if(hasObjectSelected == false)
        {
            //Select an Object
            WorldGridData selectedData = null;
            if (defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one) == false)
            {
                selectedData = defenseObjects;
            }
            if (selectedData == null)
            {
                //do something
            }
            else
            {
                worldGridObjectIndex = selectedData.GetRepresentationIndex(worldGridPosition);
                if (worldGridObjectIndex == -1)
                    return;

                GameObject prefab = objectPlacer.GetObjectAt(worldGridObjectIndex);
                objectGridSize = selectedData.GetObjectGridSize(worldGridPosition);
                objectWorldGridID = selectedData.GetIDAt(worldGridPosition);
                databaseObjectIndex = databaseObjectIndex = database.objectsData.FindIndex(data => data.ID == selectedData.GetObjectDatabaseIndex(worldGridPosition));
                selectedData.RemoveObjectAt(worldGridPosition);
                objectPlacer.RemoveObjectAt(worldGridObjectIndex);

                previewSystem.StartShowingPlacementPreview(prefab, objectGridSize);
                hasObjectSelected = true;
            }
        }
        else
        {


            bool placementValidity = CheckPlacementValidity(worldGridPosition);
            if (placementValidity == false)
                return;

            GameObject prefab = database.objectsData[databaseObjectIndex].Prefab;

            int index = objectPlacer.PlaceObject(prefab, previewSystem.GetPreviewRotation(), previewSystem.GetPreviewPosition());

            defenseObjects.AddObjectAt(
                worldGridPosition,
                objectGridSize,
                objectWorldGridID,
                index);

            previewSystem.StopShowingPreview();
            worldGridObjectIndex = -1;
            databaseObjectIndex = -1;
            hasObjectSelected = false;
        }
        


    }
    private bool CheckIfSelectionIsValid(Vector3Int worldGridPosition)
    {
        return !defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one);
    }
    private bool CheckPlacementValidity(Vector3Int worldGridPosition, int selectedObjectIndex)
    {
        return defenseObjects.CanPlaceObjectAt(worldGridPosition, database.objectsData[selectedObjectIndex].Size);
    }
    private bool CheckPlacementValidity(Vector3Int worldGridPosition)
    {
        return defenseObjects.CanPlaceObjectAt(worldGridPosition, objectGridSize);
    }

    public void RotateObject(float angle)
    {
        if (databaseObjectIndex == -1 || hasObjectSelected == false)
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

    public void UpdateState(Vector3Int worldGridPosition)
    {
        bool validity = CheckIfSelectionIsValid(worldGridPosition);
        previewSystem.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), validity);
    }
}