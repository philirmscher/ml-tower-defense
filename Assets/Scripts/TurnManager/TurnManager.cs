using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

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
    [SerializeField] private List<EnemyWave> enemyWaves;
    [SerializeField] private PreviewSystem previewSystem;
    [SerializeField] private ObjectPlacer objectPlacer;
    
    public UnityEvent<Building, int> onBuildingDestroyed;
    public UnityEvent<EnemyScript> onEnemyKilled;
    public UnityEvent<bool, float> onTurnEnd;

    public EnemyWave currentEnemyWave;
    private List<GameObject> enemies = new ();
    private List<Building> buildings = new ();

    public bool isTurnPhase { get; private set; }
    public float turnStartTimeInMs { get; private set; }
    private int turnNumber = 1;
    
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
        buildings.Remove(building);
        var weaponsLeft = buildings.FindAll(b => b.GetBuildingType() == Building.BuildingType.Tower).Count;
        
        onBuildingDestroyed.Invoke(building, weaponsLeft);
        
        if(building.GetBuildingType() == Building.BuildingType.Base) EndTurn(false);
    }
    
    private void EndTurn(bool win)
    {
        if (win)
        {
            Debug.Log("You win!");
        }
        else
        {
            Debug.Log("You lose!");
        }
        StartPreTurnPhase();
        buildings.Clear();
        enemies.Clear();
        onTurnEnd.Invoke(win, Time.time - turnStartTimeInMs);
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

        if (objectPlacer != null)
        {
            buildings.AddRange(objectPlacer.GetPlacedGameObjects().ConvertAll(building => building.GetComponent<Building>()));
            buildings.ForEach(building => building.turnManager = this);
        }
        
        currentEnemyWave = type != PlayType.Training ? enemyWaves[turnNumber - 1] : GenerateRandomEnemyWave();
        isTurnPhase = true;
        if (type == PlayType.Demo) StartDemoTurn();
    }
    
    private void StartDemoTurn()
    {
        var index = 0;
        foreach (var enemyPlacement in currentEnemyWave.enemyPlacements)
        {
            for (var i = 0; i < enemyPlacement.amount; i++)
            {
                SpawnEnemy(index, new Vector3(-15, 0, -15));
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

    private void StartPreTurnPhase()
    {
        if(!isTurnPhase) return;
        isTurnPhase = false;
        RemoveAllEnemies();
        if(type != PlayType.Training) RepairBuildings();
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
        enemies.ForEach(Destroy);
    }
}
