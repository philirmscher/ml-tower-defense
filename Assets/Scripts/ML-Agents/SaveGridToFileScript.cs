using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class SerializedGridObject
{
    public string name;
    public Vector3 position;
    public Vector3 rotation;
}

public class SaveGridToFileScript : MonoBehaviour
{
    [SerializeField] private ObjectPlacer objectPlacer;

    public void OnSave()
    {
        var placedGameObjects = objectPlacer.GetPlacedGameObjects();
        List<SerializedGridObject> serializedGridObjects = new List<SerializedGridObject>();
        
        foreach (var placedGameObject in placedGameObjects)
        {
            var serializedGridObject = new SerializedGridObject();
            serializedGridObject.name = placedGameObject.name.Substring(0, placedGameObject.name.Length - 7);
            serializedGridObject.position = placedGameObject.transform.position;
            serializedGridObject.rotation = placedGameObject.transform.rotation.eulerAngles;
            serializedGridObjects.Add(serializedGridObject);
        }
        
        string json = JsonUtility.ToJson(serializedGridObjects);
        string path = UnityEditor.EditorUtility.SaveFilePanel(
            "Save grid to json",
            "",
            "grid.json",
            "json");
        
        System.IO.File.WriteAllText(path, json);
        
        Debug.Log(json);
    }
    
    public void LoadGrid()
    {
        string path = UnityEditor.EditorUtility.OpenFilePanel(
            "Load grid from json",
            "",
            "json");
        
        string json = System.IO.File.ReadAllText(path);
        
        List<SerializedGridObject> serializedGridObjects = JsonUtility.FromJson<List<SerializedGridObject>>(json);
        
        foreach (var serializedGridObject in serializedGridObjects)
        {
            var prefab = Resources.Load<GameObject>(serializedGridObject.name);
            objectPlacer.PlaceObject(prefab, Quaternion.Euler(serializedGridObject.rotation.x, serializedGridObject.rotation.y, serializedGridObject.rotation.z), new Vector3(serializedGridObject.position.x, serializedGridObject.position.y, serializedGridObject.position.z));
        }
        
        Debug.Log(json);
    }

}