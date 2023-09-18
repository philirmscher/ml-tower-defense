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
    [SerializeField] private LayerMask hoverLayerMask; // LayerMask to specify which objects can be hovered over to show the radius
    private Vector3 lastPosition;

    public event Action OnLeftClickedUp, OnLeftClickedDown, OnRightClicked, OnExit, OnPressR, OnTabPressed;
    private RadiusVisualizer lastHoveredObject;

    private void Update()
    {
        HandleHover();
        UpdateShaderUVCoordinates();

        if (Input.GetMouseButtonDown(0))
        {
            OnLeftClickedDown?.Invoke();
        }

        if (Input.GetMouseButtonUp(0))
        {
            OnLeftClickedUp?.Invoke();
        }

        if (Input.GetMouseButtonDown(1))
            OnRightClicked?.Invoke();

        if (Input.GetKeyDown(KeyCode.Escape))
            OnExit?.Invoke();

        if (Input.GetKeyDown(KeyCode.R))
            OnPressR?.Invoke();

        if (Input.GetKeyDown(KeyCode.Tab))
            OnTabPressed?.Invoke();
    }
    private void HandleHover()
    {
        if (IsPointerOverUI())
            return;

        Ray ray = sceneCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, Mathf.Infinity, hoverLayerMask))
        {
            RadiusVisualizer hoveredObject = hit.collider.GetComponent<RadiusVisualizer>();

            if (hoveredObject != null)
            {
                if (lastHoveredObject != hoveredObject)
                {
                    if (lastHoveredObject != null)
                    {
                        lastHoveredObject.HideRadius();
                    }
                    hoveredObject.ShowRadius();
                    lastHoveredObject = hoveredObject;
                }
            }
            else
            {
                if (lastHoveredObject != null)
                {
                    lastHoveredObject.HideRadius();
                    lastHoveredObject = null;
                }
            }
        }
        else
        {
            if (lastHoveredObject != null)
            {
                lastHoveredObject.HideRadius();
                lastHoveredObject = null;
            }
        }
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