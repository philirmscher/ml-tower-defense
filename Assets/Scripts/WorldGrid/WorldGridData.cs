using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldGridData
{
    Dictionary<Vector3Int, PlacementData> placedObjects = new();
    public void AddObjectAt(
        Vector3Int gridPosition, 
        Vector2Int objectSize, 
        int ID, 
        int placedObjectIndex)
    {
        List<Vector3Int> positionToOccupy = CalculatePositions(gridPosition, objectSize);
        PlacementData data = new PlacementData(positionToOccupy, ID, placedObjectIndex);
        foreach(var pos in positionToOccupy)
        {
            if (placedObjects.ContainsKey(pos))
                throw new Exception($"Dictionary already contains this cell position {pos}");
            placedObjects[pos] = data;
        }
    }

    private List<Vector3Int> CalculatePositions(Vector3Int gridPosition, Vector2Int objectSize)
    {
        List<Vector3Int> returnVal = new();
        for (int x = 0; x < objectSize.x; x++)
        {
            for (int y = 0; y < objectSize.y; y++)
            {
                returnVal.Add(gridPosition + new Vector3Int(x, 0, y));
            }
        }
        return returnVal;
    }

    public bool CanPlaceObjectAt(Vector3Int gridPosition, Vector2Int objectSize)
    {
        List<Vector3Int> positionToOccupy = CalculatePositions(gridPosition, objectSize);
        foreach (var pos in positionToOccupy)
        {
            if (placedObjects.ContainsKey(pos))
                return false;
        }
        return true;
    }

    internal void RemoveObjectAt(Vector3Int worldGridPosition)
    {
        foreach (var pos in placedObjects[worldGridPosition].occupiedPositions)
        {
            placedObjects.Remove(pos);
        }
    }

    public Vector2Int GetObjectGridSize(Vector3Int worldGridPosition)
    {
        if (placedObjects.TryGetValue(worldGridPosition, out PlacementData data))
        {
            Vector2Int smallestPos = new Vector2Int(-1, -1);
            Vector2Int largestPos = new Vector2Int(-1, -1);


            foreach (var pos in data.occupiedPositions)
            {
                if(smallestPos == new Vector2Int(-1, -1))
                {
                    smallestPos = new Vector2Int(pos.x, pos.z);
                }
                if (largestPos == new Vector2Int(-1, -1))
                {
                    largestPos = new Vector2Int(pos.x, pos.z);
                }

                if (smallestPos.x > pos.x)
                    smallestPos.x = pos.x;
                if (smallestPos.y > pos.z)
                    smallestPos.y = pos.z;

                if (largestPos.x < pos.x)
                    largestPos.x = pos.x;
                if (largestPos.y < pos.z)
                    largestPos.y = pos.z;

            }


            return new Vector2Int(largestPos.x - smallestPos.x + 1, largestPos.y - smallestPos.y + 1);
        }

        return Vector2Int.zero;
    }
    public int GetIDAt(Vector3Int worldGridPosition)
    {
        if (placedObjects.TryGetValue(worldGridPosition, out PlacementData placementData))
        {
            return placementData.ID;
        }

        Debug.Log($"Worldgridposition: {worldGridPosition}");
        return -1; // oder einen anderen Rückgabewert, der den Fall abdeckt, wenn keine ID gefunden wurde
    }

    public int GetObjectID(Vector3Int worldGridPosition)
    {
        if (placedObjects.ContainsKey(worldGridPosition) == false)
            return -1;

        Debug.Log($" ID: {placedObjects[worldGridPosition].ID}");
        return placedObjects[worldGridPosition].ID;
    }

    internal int GetRepresentationIndex(Vector3Int worldGridPosition)
    {
        if(placedObjects.ContainsKey(worldGridPosition) == false)
            return -1;
        return placedObjects[worldGridPosition].PlacedObjectsIndex;
    }
    public Vector3Int GetObjectGridPosition(Vector3Int worldGridPosition)
    {
        if (placedObjects.TryGetValue(worldGridPosition, out PlacementData placementData))
        {
            Vector3Int bottomLeftCell = GetBottomLeftCell(placementData.occupiedPositions);

            return bottomLeftCell;
        }

        return Vector3Int.zero; // oder einen anderen Rückgabewert, der den Fall abdeckt, wenn keine Position gefunden wurde
    }

    private Vector3Int GetBottomLeftCell(List<Vector3Int> occupiedPositions)
    {
        Vector3Int bottomLeftCell = occupiedPositions[0];

        foreach (Vector3Int position in occupiedPositions)
        {
            if (position.x < bottomLeftCell.x)
                bottomLeftCell.x = position.x;
            if (position.z < bottomLeftCell.z)
                bottomLeftCell.z = position.z;
        }

        return bottomLeftCell;
    }
}

internal class PlacementData
{
    public List<Vector3Int> occupiedPositions;
    public int ID { 
        get; private set; 
    }
    public int PlacedObjectsIndex { 
        get; private set; 
    }

    public PlacementData(List<Vector3Int> occupiedPosition, int iD, int placedObjectsIndex)
    {
        this.occupiedPositions = occupiedPosition;
        ID = iD;
        PlacedObjectsIndex = placedObjectsIndex;
    }
}