using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class EnemyPlacementUI : MonoBehaviour
{
    public GameObject buttonPrefab;
    public Transform buttonContainer;
    public EnemySpawner spawner;
    public GameObject[] enemyPrefabs;

    public Button deleteAllEnemiesButton;
    private void Start()
    {
        foreach (var enemy in enemyPrefabs)
        {
            GameObject btnObj = Instantiate(buttonPrefab, buttonContainer);
            Button btn = btnObj.GetComponent<Button>();

            GameObject tempEnemy = enemy;
            btn.onClick.AddListener(() => spawner.SetEnemyToSpawn(tempEnemy));

            TextMeshProUGUI btnText = btnObj.GetComponentInChildren<TextMeshProUGUI>();
            if (btnText != null)
            {
                btnText.text = enemy.name;
            }
            else
            {
                Debug.LogWarning("Button does not have a TextMeshProUGUI component.");
            }
        }

        deleteAllEnemiesButton.onClick.AddListener(DeleteAllEnemies);
    }

    public void DeleteAllEnemies()
    {
        GameObject[] enemies = GameObject.FindGameObjectsWithTag("Enemy");
        foreach (GameObject enemy in enemies)
        {
            Destroy(enemy);
        }
    }

    public void RepairBuildings()
    {
        Building[] allBuildings = GameObject.FindObjectsOfType<Building>();

        foreach (Building building in allBuildings)
        {
            building.Repair();
        }
    }
}