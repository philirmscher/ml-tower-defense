using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldGrid_Testing : MonoBehaviour
{
    [SerializeField] private int width;
    [SerializeField] private int height;
    [SerializeField] private float cellSize;
    // Start is called before the first frame update
    void Start()
    {
        WorldGrid worldGrid1 = new WorldGrid(width, height, cellSize);
    }
}
