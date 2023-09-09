using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PreviewSystem : MonoBehaviour
{
    [SerializeField]
    private float previewYOffset = 0.06f;

    [SerializeField]
    private GameObject cellIndicator;
    private GameObject previewObject;

    [SerializeField]
    private Material previewMaterialPrefab;
    private Material previewMaterialInstance;

    private Renderer cellIndicatorRenderer;
    private Vector2Int PreviewObjectSize;

    private void Start()
    {
        previewMaterialInstance = new Material(previewMaterialPrefab);
        cellIndicator.SetActive(false);
        cellIndicatorRenderer = cellIndicator.GetComponentInChildren<Renderer>();
    }

    public void StartShowingPlacementPreview(GameObject prefab, Vector2Int size)
    {
        previewObject = Instantiate(prefab);
        PreviewObjectSize = size;
        Vector3 offsetPosition = OffsetPreviewOnGrid(previewObject.transform.position, PreviewObjectSize);
        previewObject.transform.position = offsetPosition;

        PreparePreview(previewObject);
        PrepareCursor(size);

        cellIndicator.SetActive(true);
    }

    private void PrepareCursor(Vector2Int size)
    {
        if (size.x > 0 || size.y > 0)
        {
            cellIndicator.transform.localScale = new Vector3(size.x, 1, size.y);
            cellIndicatorRenderer.material.mainTextureScale = size;
        }
    }

    public Quaternion GetPreviewRotation()
    {
        if (previewObject != null)
            return previewObject.transform.rotation;
        return Quaternion.identity;
    }
    public Vector3 GetPreviewPosition()
    {
        if (previewObject != null)
            return previewObject.transform.position;
        return Vector3.zero;
    }

    private void PreparePreview(GameObject previewObject)
    {
        Renderer[] renderers = previewObject.GetComponentsInChildren<Renderer>();
        foreach (Renderer renderer in renderers)
        {
            Material[] materials = renderer.materials;
            for (int i = 0; i < materials.Length; i++)
            {
                materials[i] = previewMaterialInstance;
            }
            renderer.materials = materials;
        }
    }

    

    internal void RotatePreview(Quaternion rotation)
    {
        if (previewObject != null)
        {
            previewObject.transform.rotation = rotation;
        }
    }

    public Vector3 OffsetPreviewOnGrid(Vector3 position, Vector2 scale)
    {
        Vector3 halfScaleOffset = new Vector3(scale.x / 2f, 0f, scale.y / 2f);
        position += halfScaleOffset;
        return position;
    }

    public void StopShowingPreview()
    {
        cellIndicator.SetActive(false);
        if (previewObject != null)
            Destroy(previewObject);
    }

    public void UpdatePosition(Vector3 position, bool validity)
    {
        if (previewObject != null)
        {
            MovePreview(position);
            ApplyColorToPreview(validity);

        }

        MoveCursor(position);
        ApplyColorToCursor(validity);
    }

    private void ApplyColorToPreview(bool validity)
    {
        Color c = validity ? Color.white : Color.red;

        c.a = 0.5f;
        previewMaterialInstance.color = c;
    }

    private void ApplyColorToCursor(bool validity)
    {
        Color c = validity ? Color.white : Color.red;

        c.a = 0.5f;
        cellIndicatorRenderer.material.color = c;
    }

    private void MoveCursor(Vector3 position)
    {
        cellIndicator.transform.position = position;
    }


    private void MovePreview(Vector3 position)
    {
        previewObject.transform.position = OffsetPreviewOnGrid(position, PreviewObjectSize);

    }

    internal void StartShowingRemovePreview()
    {
        cellIndicator.SetActive(true);
        PrepareCursor(Vector2Int.one);
        ApplyColorToCursor(false);
    }
}
