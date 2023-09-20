using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

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

[Serializable]
public enum PlayType
{
    Demo,
    Training,
    Play
}

public class TurnManager : MonoBehaviour
{
    [SerializeField] private PlayType type;
    [SerializeField] private GameObject gridSystem;
    [SerializeField] private GameObject placementUI;
    [SerializeField] private GameObject playButton;
    [SerializeField] private TMPro.TMP_Text timerText;
    [SerializeField] private TMPro.TMP_Text turnNumberText;
    [SerializeField] private GameObject postTurnUI;
    [SerializeField] private GameObject speedButtons;
    [SerializeField] private List<EnemyWave> enemyWaves;
    [SerializeField] private PreviewSystem previewSystem;
    [SerializeField] private ObjectPlacer objectPlacer;
    [SerializeField] private PlacementSystem placementSystem;

    [SerializeField] private float maxTurnTime = 180f;
    
    public UnityEvent<Building, int> onBuildingDestroyed;
    public UnityEvent<EnemyScript> onEnemyKilled;
    public UnityEvent<bool, float> onTurnEnd;

    public EnemyWave currentEnemyWave { get; private set; }
    private List<GameObject> enemies = new ();
    private List<Building> buildings = new ();

    private bool isTurnPhase;
    private float turnStartTimeInMs;
    private int turnNumber = 1;
    private int lives = 2;
    
    public void EnemyKilled(EnemyScript enemyScript)
    {
        if(!isTurnPhase) return;
        enemies.Remove(enemyScript.gameObject);
        onEnemyKilled.Invoke(enemyScript);
        
        Debug.Log(enemies.Count);
        Debug.Log(GetTroopCount());
        
        if (enemies.Count == 0 && GetTroopCount() == 0)
        {
            EndTurn(true);
        }
    }
    
    public void BuildingDestroyed(Building building)
    {
        if(!isTurnPhase) return;
        var weaponsLeft = buildings.FindAll(b => b.GetBuildingType() == Building.BuildingType.Tower && b.IsAlive()).Count;
        
        onBuildingDestroyed.Invoke(building, weaponsLeft);
        
        if(building.GetBuildingType() == Building.BuildingType.Base) EndTurn(false);
    }
    
    private void Update() {
        if (isTurnPhase && Time.time - turnStartTimeInMs > maxTurnTime)
        {
            EndTurn(true);
        }
        if (isTurnPhase && timerText != null)
        {
            timerText.SetText(GetTimeSinceTurnStart());
        }
    }
    
    public void Set1XSpeed()
    {
        Time.timeScale = 1;
    }
    
    public void Set2XSpeed()
    {
        Time.timeScale = 2;
    }
    
    public void Set3XSpeed()
    {
        Time.timeScale = 4;
    }
    
    private void EndTurn(bool win)
    {
        if(!isTurnPhase) return;
        isTurnPhase = false;
        if(type != PlayType.Training) Set1XSpeed();
        if(speedButtons != null)
            speedButtons.SetActive(false);
        if (win)
        {
            Debug.Log("You win!");
        }
        else
        {
            Debug.Log("You lose!");
            if(type != PlayType.Training) lives--;
        }
        var time = Time.time - turnStartTimeInMs;
        onTurnEnd.Invoke(!win, time);

        if (postTurnUI == null)
        {
            StartPreTurnPhase(win);
            return;
        }
        var winLoseText = postTurnUI.transform.Find("WinLoseText").GetComponent<TMPro.TMP_Text>();
        winLoseText.SetText(win ? "You win!" : "You lose!");
        
        var statusText = postTurnUI.transform.Find("Status").GetComponent<TMPro.TMP_Text>();
        statusText.SetText(win ? "You have defeated the enemy in " + GetTimeSinceTurnStart() : lives > 0 ? "You have " + lives + " lives left" : "You have no lives left");
        
        postTurnUI.transform.Find("ContinueButton").gameObject.SetActive(win);
        postTurnUI.transform.Find("RetryButton").gameObject.SetActive(!win && lives > 0);
        postTurnUI.transform.Find("LeaveButton").gameObject.SetActive(!win && lives <= 0);
        
        postTurnUI.SetActive(true);
    }
    
    public void Continue()
    {
        postTurnUI.SetActive(false);
        StartPreTurnPhase(true);
    }
    
    public void Retry()
    {
        postTurnUI.SetActive(false);
        StartPreTurnPhase(false);
    }
    
    public void Quit()
    {
        SceneManager.LoadScene("Main_Menu");
    }
    
    public void RegisterBuilding(Building building)
    {
        building.turnManager = this;
        buildings.Add(building);
    }

    public void SpawnEnemy(int index, Vector3 position)
    {
        if(currentEnemyWave == null) return;
        
        if(currentEnemyWave.enemyPlacements[index].amount <= 0)
            return;
        
        currentEnemyWave.enemyPlacements[index].amount--;
        
        var enemy = Instantiate(currentEnemyWave.enemyPlacements[index].prefab,  position, Quaternion.identity);
        enemy.AddComponent<StupidTroopAIScript>();
        enemy.GetComponent<EnemyScript>().turnManager = this;
        enemies.Add(enemy);
    }
    
    private int GetTroopCount()
    {
        var troopCount = 0;
        foreach (var enemyPlacement in currentEnemyWave.enemyPlacements)
        {
            troopCount += enemyPlacement.amount;
        }

        return troopCount;
    }

    public void StartTurnPhase()
    {
        if(isTurnPhase) return;
        
        if (objectPlacer != null)
        {
            buildings.AddRange(objectPlacer.GetPlacedGameObjects().ConvertAll(building => building != null ? building.GetComponent<Building>() : null));
            buildings.ForEach(building => {
                if (building != null)
                {
                    building.turnManager = this;
                }
            });
        }
        
        buildings.RemoveAll(building => building == null);

        if (buildings.Find(building => building.GetBuildingType() == Building.BuildingType.Base) == null)
        {
            Debug.Log("No base found!");
            return;
        }
        
        if(speedButtons != null)
            speedButtons.SetActive(true);
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

        if(type != PlayType.Training || placementSystem != null)
        placementSystem.StopPlacement();

        if(previewSystem != null)
            previewSystem.StopShowingPreview();
        
        currentEnemyWave = CopyEnemyWave(type != PlayType.Training ? enemyWaves[turnNumber - 1] : GenerateRandomEnemyWave());
        isTurnPhase = true;
        if (type == PlayType.Demo) StartDemoTurn();
    }
    
    private void StartDemoTurn()
    {
        var index = 0;
        foreach (var enemyPlacement in currentEnemyWave.enemyPlacements)
        {
            var amount = enemyPlacement.amount;
            for (var i = 0; i < amount; i++)
            {
                SpawnEnemy(index, VariantVector(new Vector3(-15, 0, -15)));
            }
            index++;
        }
    }

    private EnemyWave GenerateRandomEnemyWave()
    {
        var enemyWave = new EnemyWave();
        enemyWave.enemyPlacements = new List<EnemyPlacement>();
        var amount = 0;
        foreach (var enemyPlacement in enemyWaves[0].enemyPlacements)
        {
            var a = UnityEngine.Random.Range(0, 10);
            enemyWave.enemyPlacements.Add(new EnemyPlacement
            {
                prefab = enemyPlacement.prefab,
                amount = a
            });
            amount += a;
        }
        if(amount < 5) enemyWave.enemyPlacements[UnityEngine.Random.Range(0, enemyWaves[0].enemyPlacements.Count)].amount++;
        return enemyWave;
    }

    private void StartPreTurnPhase(bool won)
    {
        RemoveAllEnemies();
        if(type != PlayType.Training) RepairBuildings();
        if (timerText != null)
            timerText.SetText("");
        if (turnNumberText != null)
        {
            if(won) turnNumber++;
            turnNumberText.SetText($"Turn {turnNumber}");
        }

        if (placementUI != null)
            placementUI.SetActive(true);
        if (gridSystem != null)
            gridSystem.SetActive(true);
        if (playButton != null)
            playButton.SetActive(true);
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
        Debug.Log("Repair buildings!");
        foreach(var building in buildings)
        {
            building.Repair();
        }
        buildings.Clear();
    }

    private void RemoveAllEnemies()
    {
        Debug.Log("Removing all enemies!");
        enemies.ForEach(Destroy);
        enemies.Clear();
    }
    
    private EnemyWave CopyEnemyWave(EnemyWave enemyWave)
    {
        var newEnemyWave = new EnemyWave();
        newEnemyWave.enemyPlacements = new List<EnemyPlacement>();
        foreach (var enemyPlacement in enemyWave.enemyPlacements)
        {
            newEnemyWave.enemyPlacements.Add(new EnemyPlacement
            {
                prefab = enemyPlacement.prefab,
                amount = enemyPlacement.amount
            });
        }

        return newEnemyWave;
    }
    
    private Vector3 VariantVector(Vector3 vector)
    {
        return new Vector3(vector.x + UnityEngine.Random.Range(-5f, 5f), vector.y, vector.z + UnityEngine.Random.Range(-5f, 5f));
    }
}
