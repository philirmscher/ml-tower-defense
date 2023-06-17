using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PointsManager : MonoBehaviour
{
    [SerializeField] private int points;

    public event System.Action OnPointsChanged;

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
}
