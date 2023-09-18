using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectPlacer : MonoBehaviour
{
    [SerializeField] private List<GameObject> placedGameObjects = new();
    
    public List<GameObject> GetPlacedGameObjects()
    {
        return placedGameObjects;
    }

    public int PlaceObject(GameObject prefab, Quaternion previewRotation, Vector3 previewPosition)
    {
        GameObject newObject = Instantiate(prefab);
        newObject.transform.position = previewPosition;
        newObject.transform.rotation = previewRotation;
        placedGameObjects.Add(newObject);
        return placedGameObjects.Count - 1;
    }

    internal void RemoveObjectAt(int gameObjectIndex)
    {
        if (placedGameObjects.Count <= gameObjectIndex || placedGameObjects[gameObjectIndex] == null)
            return;
        Destroy(placedGameObjects[gameObjectIndex]);
        placedGameObjects[gameObjectIndex] = null;
    }

    public GameObject GetObjectAt(int gameObjectIndex)
    {
        if (placedGameObjects.Count <= gameObjectIndex || placedGameObjects[gameObjectIndex] == null)
            return null;
        return placedGameObjects[gameObjectIndex];
    }

    public Quaternion GetObjectRotation(int gameObjectIndex)
    {
        if (placedGameObjects.Count <= gameObjectIndex || placedGameObjects[gameObjectIndex] == null)
            return Quaternion.identity;
        return placedGameObjects[gameObjectIndex].transform.rotation;
    }

    public Vector3 GetObjectPosition(int gameObjectIndex)
    {
        if (placedGameObjects.Count <= gameObjectIndex || placedGameObjects[gameObjectIndex] == null)
            return Vector3.zero;
        return placedGameObjects[gameObjectIndex].transform.position;
    }
}
