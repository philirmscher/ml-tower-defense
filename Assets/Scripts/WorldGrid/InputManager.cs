using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class InputManager : MonoBehaviour
{
    [SerializeField] private Camera sceneCamera;
    [SerializeField] private LayerMask placementLayermask;

    private Vector3 lastPosition;

    public event Action OnLeftClicked, OnRightClicked, OnExit, OnPressR, OnTabPressed;

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
            OnLeftClicked?.Invoke();
        if (Input.GetMouseButtonDown(1))
            OnRightClicked?.Invoke();
        if (Input.GetKeyDown(KeyCode.Escape))
            OnExit?.Invoke();
        if (Input.GetKeyDown(KeyCode.R))
            OnPressR?.Invoke();
        if (Input.GetKeyDown(KeyCode.Tab))
            OnTabPressed?.Invoke();
    }

    public bool IsPointerOverUI()
        => EventSystem.current.IsPointerOverGameObject();

    public Vector3 GetSelectedMapPosition()
    {
        Vector3 mousePos = Input.mousePosition;
        mousePos.z = sceneCamera.nearClipPlane;
        Ray ray = sceneCamera.ScreenPointToRay(mousePos);
        RaycastHit hit;
        if(Physics.Raycast(ray, out hit, 100, placementLayermask))
        {
            lastPosition = hit.point;
        }
        return lastPosition;
    }
}


