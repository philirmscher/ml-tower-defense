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

    private List<Vector3Int> previewGridPositions = new List<Vector3Int>();

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

    public Vector3Int OffsetPreviewOnGrid(Vector3Int position, Vector2Int scale)
    {
        Vector3Int halfScaleOffset = new Vector3Int(scale.x / 2, 0, scale.y / 2);
        position += halfScaleOffset;
        return position;
    }


    public void StopShowingPreview()
    {
        cellIndicator.SetActive(false);
        if (previewObject != null)
            Destroy(previewObject);
    }

    public void UpdatePosition(Vector3 gridStartPos, Vector3 gridEndPos, bool validity)
    {
        MovePreview(gridStartPos, gridEndPos);
        ApplyColorToPreview(validity);

        // Position des Cursors aktualisieren (optional, je nach Bedarf)
        MoveCursor(gridEndPos);
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

    private void MovePreview(Vector3 gridStartPos, Vector3 gridEndPos)
    {
        previewGridPositions.Clear();

        if (previewObject == null) return;

        // Differenz zwischen Start- und Endpunkt berechnen
        Vector3 diff = new Vector3(Mathf.Round(gridEndPos.x - gridStartPos.x), 0, Mathf.Round(gridEndPos.z - gridStartPos.z));
        bool isAlongXAxis = Mathf.Abs(diff.x) > Mathf.Abs(diff.z) || Mathf.Approximately(diff.z, 0);

        // Den Abstand und die Richtung bestimmen
        int distance;
        Vector3 direction;

        if (isAlongXAxis)
        {
            distance = Mathf.CeilToInt(Mathf.Abs(diff.x) / PreviewObjectSize.x) - 1;
            direction = diff.x > 0 ? Vector3.right : Vector3.left;
        }
        else // Ansonsten orientieren wir uns an der z-Achse
        {
            distance = Mathf.CeilToInt(Mathf.Abs(diff.z) / PreviewObjectSize.x) - 1;
            direction = diff.z > 0 ? Vector3.forward : Vector3.back;
        }

        // Vorherige Vorschauprefabs zerstören, AUSSER das ursprüngliche `previewObject`
        foreach (Transform child in transform)
        {
            if (child.gameObject != previewObject)
                Destroy(child.gameObject);
        }

        // Das ursprüngliche `previewObject` an der Startposition positionieren
        previewObject.transform.position = OffsetPreviewOnGrid(gridStartPos, PreviewObjectSize);
        Vector3Int gridStartPosInt = new Vector3Int(Mathf.RoundToInt(previewObject.transform.position.x), Mathf.RoundToInt(previewObject.transform.position.y), Mathf.RoundToInt(previewObject.transform.position.z));
        previewGridPositions.Add( gridStartPosInt);

        for (int i = 1; i <= distance; i++) // Starte bei 1, da das `previewObject` bereits an der Startposition ist
        {
            GameObject instance = Instantiate(previewObject, transform);
            Vector3 positionOffset = direction * i * (isAlongXAxis ? PreviewObjectSize.x : PreviewObjectSize.y);

            instance.transform.position = OffsetPreviewOnGrid(gridStartPos + positionOffset, PreviewObjectSize);
            gridStartPosInt = new Vector3Int(Mathf.RoundToInt(instance.transform.position.x), Mathf.RoundToInt(instance.transform.position.y), Mathf.RoundToInt(instance.transform.position.z));
            previewGridPositions.Add(gridStartPosInt);
        }
    }


    public List<Vector3Int> GetPreviewGridPositions()
    {
        return previewGridPositions;
    }


    internal void StartShowingRemovePreview()
    {
        cellIndicator.SetActive(true);
        PrepareCursor(Vector2Int.one);
        ApplyColorToCursor(false);
    }
}
