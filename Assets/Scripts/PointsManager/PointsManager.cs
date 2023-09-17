using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointsManager : MonoBehaviour
{
    [SerializeField] private int points;
    [SerializeField] private ObjectsDataBase database;
    [SerializeField] private ObjectPlacer objectPlacer;

    private List<int> availableInstancesList;

    public event System.Action OnPointsChanged;
    public event System.Action OnAvailabilityChanged;
    private void Awake()
    {
        availableInstancesList = new List<int>();

        foreach (ObjectsData objectData in database.objectsData)
        {
            availableInstancesList.Add(objectData.AvailableInstances);
        }

        // Check if the number of elements in availableInstancesList matches the number of elements in database.objectsData
        if (availableInstancesList.Count != database.objectsData.Count)
        {
            Debug.LogError("The number of elements in availableInstancesList does not match the number of elements in database.objectsData!");
            return;
        }
    }
    public int GetCurrentPoints()
    {
        return points;
    }

    public void AddPoints(int points)
    {
        if(points >= 0)
        this.points += points;
        OnPointsChanged?.Invoke();
    }

    public bool RemovePoints(int points)
    {
        if (points > this.points)
            return false;

        this.points -= points;
        OnPointsChanged?.Invoke();
        return true;
    }

    public bool CheckPlaceObject(int databaseObjectIndex)
    {
        var n = database.objectsData[databaseObjectIndex].Prefab.name;
        var count = 0;
        foreach (var go in objectPlacer.GetPlacedGameObjects())
        {
            if (go.name.Contains(n))
            {
                if(++count >= database.objectsData[databaseObjectIndex].AvailableInstances)
                {
                    Debug.Log("No available Instances!");
                    return false;
                }
            }
        }
        if (availableInstancesList[databaseObjectIndex] > 0)
            return true;
        else
        {
            if (database.objectsData[databaseObjectIndex].Cost > this.points)
            {
                Debug.Log("No available Points!");
                return false;
            }
            return true;
        }
    }

    public void PlaceObject(int databaseObjectIndex)
    {
        var n = database.objectsData[databaseObjectIndex].Prefab.name;
        var count = 0;
        foreach (var go in objectPlacer.GetPlacedGameObjects())
        {
            if (go.name.Contains(n))
            {
                if(++count >= database.objectsData[databaseObjectIndex].AvailableInstances)
                {
                    Debug.Log("No available Instances!");
                    return;
                }
            }
        }
        
        if(availableInstancesList[databaseObjectIndex] > 0)
        {
            availableInstancesList[databaseObjectIndex] -= 1;
            OnAvailabilityChanged?.Invoke();
        }
        else
        {
            if (database.objectsData[databaseObjectIndex].Cost > this.points)
            {
                Debug.Log("No available Points!");
            }

            this.points -= database.objectsData[databaseObjectIndex].Cost;
            OnPointsChanged?.Invoke();
        }
    }

    public void RemoveObject(int databaseObjectIndex)
    {
        availableInstancesList[databaseObjectIndex] += 1;
        OnAvailabilityChanged?.Invoke();
    }

    public int GetAvailability(int databaseObjectIndex)
    {
        return availableInstancesList[databaseObjectIndex];
    }
}
