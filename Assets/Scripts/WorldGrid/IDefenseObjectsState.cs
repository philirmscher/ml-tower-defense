using UnityEngine;

public interface IDefenseObjectsState
{
    void EndState();
    void OnAction(Vector3Int worldGridPosition);
    void UpdateState(Vector3Int worldGridPosition);
}