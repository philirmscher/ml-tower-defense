using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointsManager : MonoBehaviour
{
    [SerializeField] private int points;
    [SerializeField] private ObjectsDataBase database;

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
        if (availableInstancesList[databaseObjectIndex] > 0)
            return true;
        else
        {
            if (database.objectsData[databaseObjectIndex].Cost > points)
            {
                Debug.Log("No available Points!");
                return false;
            }
            return true;
        }
    }

    public bool PlaceObject(int databaseObjectIndex)
    {

        if(availableInstancesList[databaseObjectIndex] > 0)
        {
            availableInstancesList[databaseObjectIndex] -= 1;
            OnAvailabilityChanged?.Invoke();
        }
        else
        {
            return false;
        }
        
        if (database.objectsData[databaseObjectIndex].Cost > points)
        {
            Debug.Log("No available Points!");
            return false;
        }

        RemovePoints(database.objectsData[databaseObjectIndex].Cost);
        return true;
    }

    public void RemoveObject(int databaseObjectIndex)
    {
        availableInstancesList[databaseObjectIndex] += 1;
        
        AddPoints(database.objectsData[databaseObjectIndex].Cost);
        
        OnAvailabilityChanged?.Invoke();
    }

    public int GetAvailability(int databaseObjectIndex)
    {
        return availableInstancesList[databaseObjectIndex];
    }
}
