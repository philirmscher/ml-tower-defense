using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RemovmentState : IDefenseObjectsState
{
    private int worldGridObjectIndex = -1;
    Grid worldGrid;
    PreviewSystem previewSystem;
    ObjectPlacer objectPlacer;
    WorldGridData defenseObjects;
    ObjectsDataBase database;
    PointsManager pointsManager;

    public RemovmentState(Grid worldGrid,
                          PreviewSystem previewSystem,
                          ObjectPlacer objectPlacer,
                          WorldGridData defenseObjects,
                          ObjectsDataBase database,
                          PointsManager pointsManager)
    {
        this.worldGrid = worldGrid;
        this.previewSystem = previewSystem;
        this.objectPlacer = objectPlacer;
        this.defenseObjects = defenseObjects;
        this.database = database;
        this.pointsManager = pointsManager;

        previewSystem.StartShowingRemovePreview();
    }

    public void EndState()
    {
        previewSystem.StopShowingPreview();
    }

    public void OnLeftClicked(Vector3Int worldGridPosition)
    {
        WorldGridData selectedData = null;
        if (defenseObjects.CanPlaceObjectAt(worldGridPosition,Vector2Int.one) == false)
        {
            selectedData = defenseObjects;
        }

        if(selectedData == null)
        {
            //do something
        }
        else
        {
            worldGridObjectIndex = selectedData.GetRepresentationIndex(worldGridPosition);
            if (worldGridObjectIndex == -1)
                return;

            pointsManager.RemoveObject(database.objectsData.FindIndex(data => data.ID == selectedData.GetIDAt(worldGridPosition)));
            selectedData.RemoveObjectAt(worldGridPosition);
            objectPlacer.RemoveObjectAt(worldGridObjectIndex);
        }
        Vector3 cellPosition = worldGrid.CellToWorld(worldGridPosition);
        previewSystem.UpdatePosition(cellPosition, CheckIfSelectionIsValid(worldGridPosition));
    }

    private bool CheckIfSelectionIsValid(Vector3Int worldGridPosition)
    {
        return !defenseObjects.CanPlaceObjectAt(worldGridPosition, Vector2Int.one);
    }

    public void UpdateState(Vector3Int worldGridPosition)
    {
        bool validity = CheckIfSelectionIsValid(worldGridPosition);
        previewSystem.UpdatePosition(worldGrid.CellToWorld(worldGridPosition), validity);
    }

    public void RotateObject(float angle)
    {
        // Do nothing since rotation doesn't make sense in the removal state
    }

    public void OnRightClicked(Vector3Int worldGridPosition)
    {
        throw new NotImplementedException();
    }
}
