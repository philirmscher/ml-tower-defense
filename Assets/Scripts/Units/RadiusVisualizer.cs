using System.Collections;
using UnityEngine;

public class RadiusVisualizer : MonoBehaviour
{
    [SerializeField] private ParticleSystem targetParticleSystem;

    private ParticleSystem.MainModule mainModule;
    private float displayRadius;
    private void Awake()
    {
        mainModule = targetParticleSystem.main;

        displayRadius = GetDisplayRadiusFromAttachedScripts();
        if (displayRadius > 0)
        {
            SetRadius(displayRadius);
        }

        HideRadius();
    }

    public void ShowRadius()
    {
        UpdateRadius();
        targetParticleSystem.Play();
        Debug.Log("Showing radius for object: " + this.name);
    }

    public void HideRadius()
    {
        StartCoroutine(FadeOutParticles());
    }

    private IEnumerator FadeOutParticles()
    {
        targetParticleSystem.Stop(); // Stop emitting new particles

        // Wait until all particles are dead
        while (targetParticleSystem.IsAlive(true))
        {
            yield return null;
        }

        targetParticleSystem.Clear(); // Clear all particles
    }

    private void UpdateRadius()
    {
        mainModule.startSize3D = true;
        mainModule.startSizeX = displayRadius * 2; // Multiplied by 2 because it represents diameter
        mainModule.startSizeY = displayRadius * 2;
        // Set mainModule.startSizeZ if needed
    }
    private void SetRadius(float radius)
    {
        mainModule.startSize3D = true;
        mainModule.startSizeX = radius * 2; // Multiplied by 2 because it represents diameter
        mainModule.startSizeY = radius * 2;
        // Set mainModule.startSizeZ if needed
    }

    private float GetDisplayRadiusFromAttachedScripts()
    {
        // Prüfen, ob ein Building-Skript angehängt ist
        Building buildingScript = gameObject.GetComponent<Building>();
        if (buildingScript != null)
        {
            return buildingScript.attackRange;
        }

        // Prüfen, ob ein EnemyScript angehängt ist
        EnemyScript enemyScript = gameObject.GetComponent<EnemyScript>();
        if (enemyScript != null)
        {
            Debug.Log("EnemyScript detected on: " + gameObject.name + " with attackRange: " + enemyScript.attackRange);
            return enemyScript.attackRange;
        }

        return 0f; // Standardwert, wenn weder Building noch EnemyScript angehängt ist
    }
}
