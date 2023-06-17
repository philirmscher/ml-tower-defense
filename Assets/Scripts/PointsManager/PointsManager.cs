using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointsManager : MonoBehaviour
{
    [SerializeField] private int points;
    [SerializeField] private ObjectsDataBase database;

    private List<int> availableInstancesList;

    public event System.Action OnPointsChanged;
    public event System.Action OnAvailibilityChanged;
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

        if(availableInstancesList[databaseObjectIndex] > 0)
        {
            availableInstancesList[databaseObjectIndex] -= 1;
            OnAvailibilityChanged?.Invoke();
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
        Debug.Log(databaseObjectIndex);
        availableInstancesList[databaseObjectIndex] += 1;
        OnAvailibilityChanged?.Invoke();
    }

    public int GetAvailability(int databaseObjectIndex)
    {
        return availableInstancesList[databaseObjectIndex];
    }
}
