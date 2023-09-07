using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TurnManager : MonoBehaviour
{
    [SerializeField] private GameObject gridSystem;
    [SerializeField] private GameObject placementUI;
    [SerializeField] private GameObject playButton;
    [SerializeField] private TMPro.TMP_Text timerText;
    [SerializeField] private TMPro.TMP_Text turnNumberText;
    
    bool isTurnPhase = false;
    float turnStartTimeInMs = 0f;
    private int turnNumber = 1;
    
    public void StartTurnPhase()
    {
        playButton.SetActive(false);
        placementUI.SetActive(false);
        gridSystem.SetActive(false);
        turnStartTimeInMs = Time.time;
        timerText.SetText("00:00.000");
        isTurnPhase = true;
    }

    public void StartPreTurnPhase()
    {
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
}
