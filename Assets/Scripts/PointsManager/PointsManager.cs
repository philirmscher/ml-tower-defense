using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointsManager : MonoBehaviour
{
    [SerializeField] private int points;

    public PointsManager(int startPoints)
    {
        this.points = startPoints;
    }

    public int GetCurrentPoints()
    {
        return points;
    }

    public void AddPoints(int points)
    {
        this.points += points;
    }
}
