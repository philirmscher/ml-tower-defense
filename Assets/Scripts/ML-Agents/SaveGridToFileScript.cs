using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

[System.Serializable]
public class SerializedGridObject
{
    public string name;
    public Vector3 position;
    public Vector3 rotation;
}

[System.Serializable]
public class SerializedGrid
{
    public SerializedGridObject[] gridObjects;
}

[System.Serializable]
public class SerializedGrids
{
    public SerializedGrid[] grids;
}

public class SaveGridToFileScript : MonoBehaviour
{
    [SerializeField] private ObjectPlacer objectPlacer;
    [SerializeField] private PlacementSystem placementSystem;

    public void OnSave()
    {
        var placedGameObjects = objectPlacer.GetPlacedGameObjects();
        var serializedGrid = new SerializedGrid();

        List<SerializedGridObject> serializedGridObjectList = new List<SerializedGridObject>();

        foreach (var placedGameObject in placedGameObjects)
        {
            if (placedGameObject == null || string.IsNullOrEmpty(placedGameObject.name))
            {
                continue;
            }
            var serializedGridObject = new SerializedGridObject();
            serializedGridObject.name = placedGameObject.name.Substring(0, placedGameObject.name.Length - 7);
            serializedGridObject.position = placedGameObject.transform.position;
            serializedGridObject.rotation = placedGameObject.transform.rotation.eulerAngles;

            serializedGridObjectList.Add(serializedGridObject);
        }

        serializedGrid.gridObjects = serializedGridObjectList.ToArray();

        //resizes array
        var notNullGridObjects = 0;
        foreach (var serializedGridObject in serializedGrid.gridObjects)
        {
            if (serializedGridObject != null)
                notNullGridObjects++;
        }
        
        var newGridObjects = new SerializedGridObject[notNullGridObjects];
        
        for (int i = 0; i < notNullGridObjects; i++)
        {
            newGridObjects[i] = serializedGrid.gridObjects[i];
        }

        var path = Application.dataPath + "/ML-Agents/Grids.json";
        
        var serializedGrids = new SerializedGrids();
        serializedGrids.grids = new SerializedGrid[1];
        
        if(System.IO.File.Exists(path))
        {
            var json = System.IO.File.ReadAllText(path);
            serializedGrids = JsonUtility.FromJson<SerializedGrids>(json);
        
            //add new grid to grids
            var grids = serializedGrids.grids;
            var newGrids = new SerializedGrid[grids.Length + 1];
            for (int i = 0; i < grids.Length; i++)
            {
                newGrids[i] = grids[i];
            }
            newGrids[grids.Length] = serializedGrid;
            serializedGrids.grids = newGrids;
        
            var json2 = JsonUtility.ToJson(serializedGrids);
            System.IO.File.WriteAllText(path, json2);
        } 
        else
        {
            serializedGrids.grids[0] = serializedGrid;
            var json = JsonUtility.ToJson(serializedGrids);
            System.IO.File.WriteAllText(path, json);
        }
        
        Debug.Log($"Saved grid to {path}, with " + serializedGrids.grids.Length + " examples");
    }

    public SerializedGrids GetGrids()
    {
        var path = Application.dataPath + "/ML-Agents/Grids.json";
        
        if(!System.IO.File.Exists(path))
        {
            Debug.LogError($"File {path} does not exist");
            return null;
        }
        
        var json = System.IO.File.ReadAllText(path);
        
        var serializedGrids = JsonUtility.FromJson<SerializedGrids>(json);
        
        return serializedGrids;
    }
}