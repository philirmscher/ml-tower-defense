using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldGrid_Testing : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        WorldGrid worldGrid1 = new WorldGrid(10, 10, 1);
        Debug.Log("Grid created");
    }
}
