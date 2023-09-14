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

    bool isTurnPhase;
    float turnStartTimeInMs;
    private int turnNumber = 1;
    
    public void StartTurnPhase()
    {
        previewSystem.StopShowingPreview();
        playButton.SetActive(false);
        placementUI.SetActive(false);
        gridSystem.SetActive(false);
        turnStartTimeInMs = Time.time;
        timerText.SetText("00:00.000");
        StartCoroutine(enemyWaveManager.StartWave(enemyWaves[turnNumber - 1]));
        isTurnPhase = true;
    }

    public void StartPreTurnPhase()
    {
        RepairBuildings();
        isTurnPhase = false;
        timerText.SetText("");
        turnNumber++;
        turnNumberText.SetText($"Turn {turnNumber}");
        placementUI.SetActive(true);
        gridSystem.SetActive(true);
        playButton.SetActive(true);
    }

    private void Update()
    {
        if (isTurnPhase)
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
    
    public void EndTurn()
    {
        Debug.Log("Ending TURN!");
        StartPreTurnPhase();
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
        GameObject[] enemies = GameObject.FindGameObjectsWithTag("Enemy");

        foreach (GameObject enemy in enemies)
        {
            Destroy(enemy);
        }
    }
}
