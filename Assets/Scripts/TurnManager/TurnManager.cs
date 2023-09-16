using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class EnemyPlacement
{
    public GameObject prefab;
    public int amount;
}

[Serializable]
public class EnemyWave
{
    public List<EnemyPlacement> enemyPlacements;
}

public class TurnManager : MonoBehaviour
{
    [SerializeField] private GameObject gridSystem;
    [SerializeField] private GameObject placementUI;
    [SerializeField] private GameObject playButton;
    [SerializeField] private TMPro.TMP_Text timerText;
    [SerializeField] private TMPro.TMP_Text turnNumberText;
    [SerializeField] private List<EnemyWave> enemyWaves;
    [SerializeField] private EnemyWaveManager enemyWaveManager;
    [SerializeField] private PreviewSystem previewSystem;

    public bool isTurnPhase { get; private set; }
    public float turnStartTimeInMs { get; private set; }
    private int turnNumber = 1;
    
    public void TrainingTurn()
    {
        StartTurnPhase();
    }

    public void StartTurnPhase()
    {
        if(isTurnPhase) return;
        isTurnPhase = true;
        if (playButton != null)
            playButton.SetActive(false);
        if (gridSystem != null)
            gridSystem.SetActive(false);
        if (placementUI != null)
            placementUI.SetActive(false);
        turnStartTimeInMs = Time.time;
        if (timerText != null)
        {
            timerText.SetText("00:00.000");
        }

        if(previewSystem != null)
            previewSystem.StopShowingPreview();

        enemyWaveManager.StartWave(enemyWaves[turnNumber - 1]);
    }

    public void StartPreTurnPhase()
    {
        if(!isTurnPhase) return;
        isTurnPhase = false;
        RemoveAllEnemies();
        if(enemyWaveManager.type != PlayType.Training) RepairBuildings();
        if (timerText != null)
            timerText.SetText("");
        if (turnNumberText != null)
        {
            turnNumber++;
            turnNumberText.SetText($"Turn {turnNumber}");
        }

        if (placementUI != null)
            placementUI.SetActive(true);
        if (gridSystem != null)
            gridSystem.SetActive(true);
        if (playButton != null)
            playButton.SetActive(true);
    }

    private void Update()
    {
        if (isTurnPhase && timerText != null)
        {
            timerText.SetText(GetTimeSinceTurnStart());
        }
    }

    private string GetTimeSinceTurnStart()
    {
        float timeSinceTurnStartInMs = Time.time - turnStartTimeInMs;
        int minutes = (int) (timeSinceTurnStartInMs / 60f);
        int seconds = (int) (timeSinceTurnStartInMs % 60f);
        int milliseconds = (int) ((timeSinceTurnStartInMs - (int) timeSinceTurnStartInMs) * 1000f);
        return $"{minutes:00}:{seconds:00}.{milliseconds:000}";
    }

    void RepairBuildings()
    {
        Debug.Log("Rapair buildings!");
        var buildings = GameObject.FindGameObjectsWithTag("Destroyed");
        foreach(GameObject building in buildings)
        {
            building.GetComponent<Building>().Repair();
        }
    }

    public void RemoveAllEnemies()
    {
        enemyWaveManager.KillAll();
    }
}
