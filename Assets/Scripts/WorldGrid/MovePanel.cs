using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public enum PanelDirection
{
    Top,
    Bottom,
    Left,
    Right
}

public class MovePanel : MonoBehaviour
{
    [SerializeField] private RectTransform panel;
    [SerializeField] private float transitionDuration = 0.5f;
    [SerializeField] private float targetDistance = 1000f;
    [SerializeField] private InputManager inputManager;
    [SerializeField] private PanelDirection direction = PanelDirection.Left;

    private bool isPanelVisible = true;
    private Coroutine transitionCoroutine;
    private Vector2 originalPosition;

    private void Start()
    {
        inputManager.OnTabPressed += TogglePanelVisibility;
        originalPosition = panel.anchoredPosition;
    }

    private void OnDestroy()
    {
        inputManager.OnTabPressed -= TogglePanelVisibility;
    }

    private void TogglePanelVisibility()
    {
        if (transitionCoroutine != null)
        {
            StopCoroutine(transitionCoroutine);
        }

        if (isPanelVisible)
        {
            transitionCoroutine = StartCoroutine(TransitionPanel(originalPosition));
            isPanelVisible = false;
        }
        else
        {
            Vector2 targetPosition = GetTargetPosition(originalPosition, targetDistance);
            transitionCoroutine = StartCoroutine(TransitionPanel(targetPosition));
            isPanelVisible = true;
        }
    }

    private Vector2 GetTargetPosition(Vector2 startPosition, float distance)
    {
        Vector2 targetPosition = startPosition;

        switch (direction)
        {
            case PanelDirection.Top:
                targetPosition.y += distance;
                break;
            case PanelDirection.Bottom:
                targetPosition.y -= distance;
                break;
            case PanelDirection.Left:
                targetPosition.x -= distance;
                break;
            case PanelDirection.Right:
                targetPosition.x += distance;
                break;
        }

        return targetPosition;
    }

    private IEnumerator TransitionPanel(Vector2 targetPosition)
    {
        Vector2 startPosition = panel.anchoredPosition;
        float timer = 0f;

        while (timer <= transitionDuration)
        {
            float progress = timer / transitionDuration;
            panel.anchoredPosition = Vector2.Lerp(startPosition, targetPosition, progress);
            yield return null;
            timer += Time.deltaTime;
        }

        panel.anchoredPosition = targetPosition;
        transitionCoroutine = null;
    }
}