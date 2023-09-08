using UnityEngine;

public interface IDefenseObjectsState
{
    void EndState();
    void OnLeftClicked(Vector3Int worldGridPosition);
    void OnRightClicked(Vector3Int worldGridPosition);
    void UpdateState(Vector3Int worldGridPosition);
    void RotateObject(float angle);
}