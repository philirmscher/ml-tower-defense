using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldGrid
{
    [SerializeField] private int width;
    [SerializeField] private int height;
    [SerializeField] private float cellSize;
    private int[,] gridArray;

    public WorldGrid(int width, int height, float cellSize)
    {
        this.width = width;
        this.height = height;
        this.cellSize = cellSize;

        gridArray = new int[width, height];

        for(int x = 0; x<gridArray.GetLength(0); x++)
        {
            for(int z = 0; z<gridArray.GetLength(1); z++)
            {
                Debug.DrawLine(GetWorldPosition(x,0, z), GetWorldPosition(x,0, z + 1), Color.white, 100f);
                Debug.DrawLine(GetWorldPosition(x,0, z), GetWorldPosition(x+1,0, z), Color.white, 100f);
            }
        }
        Debug.DrawLine(GetWorldPosition(0,0,height), GetWorldPosition(width,0,height), Color.white, 100f);
        Debug.DrawLine(GetWorldPosition(width, 0, 0), GetWorldPosition(width, 0, height), Color.white, 100f);
    }

    private Vector3 GetWorldPosition(int x, int y, int z)
    {
        return new Vector3(x, y, z) * cellSize;
    }

}

