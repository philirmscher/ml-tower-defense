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
                                                 defenseObjects);
        inputManager.OnClicked += PlaceStructure;
        inputManager.OnExit += StopPlacement;
    }

    public void StartRemovment()
    {
        StopPlacement();
        gridVisualization.SetActive(true);
        defenseObjectsState = new RemovmentState(worldGrid, preview, objectPlacer, defenseObjects);
        inputManager.OnClicked += PlaceStructure;
        inputManager.OnExit += StopPlacement;
    }

    private void PlaceStructure()
    {
        if (inputManager.IsPointerOverUI())
            return;

        Vector3 mousePosition = inputManager.GetSelectedMapPosition();
        Vector3Int worldGridPosition = worldGrid.WorldToCell(mousePosition);

        defenseObjectsState.OnAction(worldGridPosition);
    }

    private void StopPlacement()
    {
        if (defenseObjectsState == null)
            return;

        gridVisualization.SetActive(false);
        defenseObjectsState.EndState();
        inputManager.OnClicked -= PlaceStructure;
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
