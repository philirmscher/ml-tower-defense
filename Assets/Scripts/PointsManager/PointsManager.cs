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
        
        GetComponent<TurnManager>().onEnemyKilled.AddListener((enemy) =>
        {
            AddPoints(enemy.pointsWhenKilled);
        });
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

    public void PlaceObject(int databaseObjectIndex)
    {
        var n = database.objectsData[databaseObjectIndex].Prefab.name;
        var count = 0;
        foreach (var go in objectPlacer.GetPlacedGameObjects())
        {
            if (go == null) continue;  // Skip if the GameObject is null
            if (go.name.Contains(n))
            {
                if(++count >= database.objectsData[databaseObjectIndex].MaxAvailableInstances)
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
    public bool CanPlaceMultipleObjects(int databaseObjectIndex, int count)
    {
        int availableInstances = availableInstancesList[databaseObjectIndex];

        // Die Anzahl der Objekte, die gekauft werden m�ssen, weil sie nicht verf�gbar sind
        int requiredPurchaseCount = count - availableInstances;

        if (requiredPurchaseCount > 0)
        {
            // Wenn wir Objekte kaufen m�ssen, dann berechnen wir die Gesamtkosten
            int totalCost = database.objectsData[databaseObjectIndex].Cost * requiredPurchaseCount;

            if (totalCost > this.points)
            {
                Debug.Log("Not enough points to purchase additional objects!");
                return false;
            }
        }
        return true;
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
