using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HealthBar : MonoBehaviour
{
    [SerializeField] private Slider slider;
    [SerializeField] private Transform target;
    [SerializeField] private float damageEffectDuration = 0.5f; // Duration for which the damage effect will last
    [SerializeField] private float damageEffectScale = 2f; // Factor by which health bar grows when damaged

    private float health;
    private Vector3 originalScale;
    private Color originalColor;

    private Camera camera;
    private bool isCoroutineRunning = false;
    private bool isHidden = false;

    private void Start()
    {
        camera = Camera.main;
        originalScale = transform.localScale;
        originalColor = slider.fillRect.GetComponent<Image>().color;
    }

    public void UpdateHealthBar(float currentValue, float maxValue)
    {
        if (currentValue < health && !isCoroutineRunning)
        {
            StartCoroutine(DamageEffectCoroutine());
        }
        health = currentValue;
        slider.value = currentValue / maxValue;
    }

    private IEnumerator DamageEffectCoroutine()
    {
        isCoroutineRunning = true;

        transform.localScale = originalScale * damageEffectScale;
        slider.fillRect.GetComponent<Image>().color = Color.red;

        yield return new WaitForSeconds(damageEffectDuration);

        transform.localScale = originalScale;
        slider.fillRect.GetComponent<Image>().color = originalColor;

        isCoroutineRunning = false;
    }

    void Update()
    {
        if (health <= 0 && !isHidden)
        {
            slider.gameObject.SetActive(false);  // Hide the health bar
            isHidden = true;
            return;
        }
        else if (health > 0 && isHidden)
        {
            slider.gameObject.SetActive(true);  // Show the health bar
            isHidden = false;
        }
        transform.rotation = camera.transform.rotation;
    }
}