using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class InputManager : MonoBehaviour
{
    [SerializeField] private Camera sceneCamera;
    [SerializeField] private LayerMask placementLayermask;
    [SerializeField] private Material objectMaterial; // Das Material des 3D-Objekts, das den Shader verwendet.

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

        UpdateShaderUVCoordinates();
    }

    public bool IsPointerOverUI()
        => EventSystem.current.IsPointerOverGameObject();

    public Vector3 GetSelectedMapPosition()
    {
        Vector3 mousePos = Input.mousePosition;
        mousePos.z = sceneCamera.nearClipPlane;
        Ray ray = sceneCamera.ScreenPointToRay(mousePos);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 100, placementLayermask))
        {
            lastPosition = hit.point;
        }
        return lastPosition;
    }

    private void UpdateShaderUVCoordinates()
    {
        Vector3 mousePos = Input.mousePosition;
        Ray ray = sceneCamera.ScreenPointToRay(mousePos);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 100, placementLayermask))
        {
            Vector2 uvCoordinates = hit.textureCoord;
            objectMaterial.SetVector("_MousePos", new Vector4(uvCoordinates.x, uvCoordinates.y, 0, 0));
        }
    }
}