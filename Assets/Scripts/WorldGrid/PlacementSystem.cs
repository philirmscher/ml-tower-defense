using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlacementSystem : MonoBehaviour
{
    [SerializeField] private InputManager inputManager;
    [SerializeField] private Grid worldGrid;
    [SerializeField] private ObjectsDataBase database;
    [SerializeField] private GameObject gridVisualization;
    [SerializeField] private ObjectPlacer objectPlacer;
    [SerializeField] private PointsManager pointsManager;

    private WorldGridData defenseObjects;

    IDefenseObjectsState defenseObjectsState; 

    [SerializeField] private PreviewSystem preview;
    private Vector3Int lastDetectedPostion = Vector3Int.zero;
    private void Start()
    {
        StopPlacement();
        defenseObjects = new();
    }

    public void StartPlacment(int ID)
    {
        StopPlacement();
        gridVisualization.SetActive(true);
        defenseObjectsState = new PlacementState(ID,
                                                 worldGrid,
                                                 preview,
                                                 database,
                                                 objectPlacer,
                                                 defenseObjects,
                                                 pointsManager);
        inputManager.OnLeftClicked += () => SelectWorldGrid(KeyCode.Mouse0);
        inputManager.OnRightClicked += () => SelectWorldGrid(KeyCode.Mouse1);
        inputManager.OnPressR += RotateStructure;
        inputManager.OnExit += StopPlacement;
    }

    public void RotateStructure()
    {
        // Check if an object is being placed
        if (defenseObjectsState == null)
        {
            Debug.Log("No Object being Placed!");
            return;
        }

        // Rotate the object being placed by 90 degrees clockwise
        defenseObjectsState.RotateObject(90f);
    }

    public void StartRemovment()
    {
        StopPlacement();
        gridVisualization.SetActive(true);
        defenseObjectsState = new RemovmentState(worldGrid,
                                                 preview,
                                                 objectPlacer,
                                                 defenseObjects,
                                                 database,
                                                 pointsManager);
        inputManager.OnLeftClicked += () => SelectWorldGrid(KeyCode.Mouse0);
        inputManager.OnExit += StopPlacement;
    }

    public void StartAdjustment()
    {
        StopPlacement();
        gridVisualization.SetActive(true);
        defenseObjectsState = new AdjustmentState(worldGrid,
                                                  preview,
                                                  objectPlacer,
                                                  defenseObjects,
                                                  database,
                                                  pointsManager);
        inputManager.OnLeftClicked += () => SelectWorldGrid(KeyCode.Mouse0);
        inputManager.OnPressR += RotateStructure;
        inputManager.OnExit += StopPlacement;
    }

    private void SelectWorldGrid(KeyCode key)
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);

        switch (key)
        {
            case KeyCode.Mouse0:
                defenseObjectsState.OnLeftClicked(worldGridPosition);
                break;
            case KeyCode.Mouse1:
                defenseObjectsState.OnRightClicked(worldGridPosition);
                break;
            default:
                Debug.Log("No Keycode!");
                break;
        }
    }

    private void StopPlacement()
    {
        if (defenseObjectsState == null)
            return;

        gridVisualization.SetActive(false);
        defenseObjectsState.EndState();
        inputManager.OnLeftClicked += () => SelectWorldGrid(KeyCode.Mouse0);
        inputManager.OnPressR -= RotateStructure;
        inputManager.OnExit -= StopPlacement;
        lastDetectedPostion = Vector3Int.zero;
        defenseObjectsState = null;
    }

    private void Update()
    {
        if (defenseObjectsState == null)
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);
        if(lastDetectedPostion != worldGridPosition)
        {
            defenseObjectsState.UpdateState(worldGridPosition);
            lastDetectedPostion = worldGridPosition;
        }
    }
}
