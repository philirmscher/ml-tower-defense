using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HealthBar : MonoBehaviour
{
    [SerializeField] private Slider slider;
    [SerializeField] private Transform target;
    [SerializeField] private Vector3 offset;
    [SerializeField] private float damageEffectDuration = 0.5f; // Duration for which the damage effect will last
    [SerializeField] private float damageEffectScale = 2f; // Factor by which health bar grows when damaged

    private float health;
    private Vector3 originalScale;
    private Color originalColor;

    private Camera camera;
    private bool isCoroutineRunning = false; // New variable to check if coroutine is running

    private void Start()
    {
        camera = Camera.main;
        originalScale = transform.localScale;
        originalColor = slider.fillRect.GetComponent<Image>().color; // Assuming the fill rect has an Image component
    }

    public void UpdateHealthBar(float currentValue, float maxValue)
    {
        if (currentValue < health && !isCoroutineRunning) // Check if coroutine is not running
        {
            StartCoroutine(DamageEffectCoroutine());
        }
        health = currentValue;
        slider.value = currentValue / maxValue;
    }

    private IEnumerator DamageEffectCoroutine()
    {
        isCoroutineRunning = true; // Set the flag to true when the coroutine starts

        // Scale up and change color
        transform.localScale = originalScale * damageEffectScale;
        slider.fillRect.GetComponent<Image>().color = Color.red;

        // Wait for the duration
        yield return new WaitForSeconds(damageEffectDuration);

        // Reset to original scale and color
        transform.localScale = originalScale;
        slider.fillRect.GetComponent<Image>().color = originalColor;

        isCoroutineRunning = false; // Reset the flag when the coroutine ends
    }

    void Update()
    {
        transform.rotation = camera.transform.rotation;
        target.position += offset;
    }
}