using System.Collections;
using UnityEngine;

public class RadiusVisualizer : MonoBehaviour
{
    [SerializeField] private ParticleSystem maxRadiusParticleSystem;
    [SerializeField] private ParticleSystem minRadiusParticleSystem;

    private ParticleSystem.MainModule mainModuleMax;
    private ParticleSystem.MainModule mainModuleMin;
    private float displayMaxRadius;
    private float displayMinRadius;
    private void Awake()
    {
        mainModuleMax = maxRadiusParticleSystem.main;
        mainModuleMin = minRadiusParticleSystem.main;

        GetDisplayRadiusFromAttachedScripts();

        if (displayMaxRadius > 0)
        {
            SetRadius(mainModuleMax, displayMaxRadius);
            HideRadius(maxRadiusParticleSystem);
        }
        if (displayMinRadius > 0)
        {
            SetRadius(mainModuleMin, displayMinRadius);
            HideRadius(minRadiusParticleSystem);
        }
    }

    public void ShowRadius(ParticleSystem ps, ParticleSystem.MainModule modul, float radius)
    {
        SetRadius(modul, radius);
        ps.Play();
    }

    public void ShowRadius()
    {
        if (displayMaxRadius > 0)
        {
            SetRadius(mainModuleMax, displayMaxRadius);
            maxRadiusParticleSystem.Play();
        }
        if (displayMinRadius > 0)
        {
            SetRadius(mainModuleMin, displayMinRadius);
            minRadiusParticleSystem.Play();
        }
    }

    public void HideRadius(ParticleSystem ps)
    {
        StartCoroutine(FadeOutParticles(ps));
    }

    public void HideRadius()
    {
        if(displayMaxRadius > 0)
        {
            StartCoroutine(FadeOutParticles(maxRadiusParticleSystem));
        }
        if (displayMinRadius > 0)
        {
            StartCoroutine(FadeOutParticles(minRadiusParticleSystem));
        }
    }

    private IEnumerator FadeOutParticles(ParticleSystem ps)
    {
        ps.Stop(); // Stop emitting new particles

        // Wait until all particles are dead
        while (ps.IsAlive(true))
        {
            yield return null;
        }

        ps.Clear(); // Clear all particles
    }

    private void SetRadius(ParticleSystem.MainModule mainModule, float radius)
    {
        mainModule.startSize3D = true;
        mainModule.startSizeX = radius * 2; // Multiplied by 2 because it represents diameter
        mainModule.startSizeY = radius * 2;
        // Set mainModule.startSizeZ if needed
    }

    private void GetDisplayRadiusFromAttachedScripts()
    {
        // Prüfen, ob ein Building-Skript angehängt ist
        Building buildingScript = gameObject.GetComponent<Building>();
        if (buildingScript != null)
        {
            displayMaxRadius = buildingScript.attackRange;
            displayMinRadius = buildingScript.minAttackRange;
        }

        EnemyScript enemyScript = gameObject.GetComponent<EnemyScript>();
        if (enemyScript != null)
        {
            displayMaxRadius = enemyScript.attackRange;
        }

        return; 
    }
}
