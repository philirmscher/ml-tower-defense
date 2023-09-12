using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class GridData
{
    public int[] grid; // Flatten the 2D array into a 1D array
}

public class SaveGridToFileScript : MonoBehaviour
{
    [SerializeField] private ObjectPlacer objectPlacer;

    public void OnSave()
    {
        var gridData = new GridData();
        gridData.grid = new int[40 * 40]; // Flatten the 2D array into a 1D array

        for (int i = 0; i < 40; i++)
        {
            for (int j = 0; j < 40; j++)
            {
                int index = i * 40 + j; // Calculate the 1D index
                gridData.grid[index] = -1;
            }
        }

        var placedGameObjects = objectPlacer.GetPlacedGameObjects();

        for (int i = 0; i < placedGameObjects.Count; i++)
        {
            var gameObject = placedGameObjects[i];
            if (gameObject == null)
                continue;
            var position = gameObject.transform.position;
            var x = (int)position.x + 19;
            var z = (int)position.z + 19;
            int index = x * 40 + z; // Calculate the 1D index
            gridData.grid[index] = 1;
        }

        Debug.Log(gridData.grid);

        string json = JsonUtility.ToJson(gridData); // Serialize the entire gridData object

        //save with unity file dialog
        string path = UnityEditor.EditorUtility.SaveFilePanel(
            "Save grid as json",
            "",
            "grid.json",
            "json");

        if (path.Length != 0)
        {
            System.IO.File.WriteAllText(path, json);
        }

        Debug.Log(json);
    }

}