using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RemovmentState : IDefenseObjectsState
{
    private int gameObjectIndex = -1;
    Grid worldGrid;
    PreviewSystem previewSystem;
    ObjectPlacer objectPlacer;
    WorldGridData defenseObjects;

    public RemovmentState(Grid worldGrid,
                          PreviewSystem previewSystem,
                          ObjectPlacer objectPlacer,
                          WorldGridData defenseObjects)
    {
        this.worldGrid = worldGrid;
        this.previewSystem = previewSystem;
        this.objectPlacer = objectPlacer;
        this.defenseObjects = defenseObjects;

        previewSystem.StartShowingRemovePreview();
    }

    public void EndState()
    {
        previewSystem.StopShowingPreview();
    }

    public void OnAction(Vector3Int worldGridPosition)
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
            gameObjectIndex = selectedData.GetRepresentationIndex(worldGridPosition);
            if (gameObjectIndex == -1)
                return;
            selectedData.RemoveObjectAt(worldGridPosition);
            objectPlacer.RemoveObjectAt(gameObjectIndex);
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
}
