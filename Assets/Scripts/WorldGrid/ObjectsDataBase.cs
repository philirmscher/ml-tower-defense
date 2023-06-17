using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu] public class ObjectsDataBase : ScriptableObject
{
    public List<ObjectsData> objectsData;

}

[Serializable] public class ObjectsData
{

    [field: SerializeField] public string Name { get; private set; }
    [field: SerializeField] public int ID { get; private set; }
    [field: SerializeField] public Vector2Int Size { get; private set; } = Vector2Int.one;
    [field: SerializeField] public GameObject Prefab { get; private set; }
    [field: SerializeField] public bool hasCorner { get; private set; }
    [field: SerializeField] public int Cost { get; private set; }
    [field: SerializeField] public int AvailableInstances { get; private set; } //represents current available Objectscount decreses when placing and increases when removing or buying objects
    [field: SerializeField] public int MaxAvailableInstances { get; private set; }
    [field: SerializeField] public GameObject cornerPrefab { get; private set; }
}