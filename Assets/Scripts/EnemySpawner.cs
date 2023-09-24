using UnityEngine;
using UnityEngine.EventSystems;

public class EnemySpawner : MonoBehaviour
{
    public GameObject currentEnemyPrefab;
    private Camera mainCamera;
    public bool IsPointerOverUI()
    => EventSystem.current.IsPointerOverGameObject();

    private void Start()
    {
        mainCamera = Camera.main;
    }

    private void Update()
    {

        if (Input.GetKeyDown(KeyCode.Escape))
        {
            currentEnemyPrefab = null;
        }

        if (IsPointerOverUI())
            return;

        if (currentEnemyPrefab != null && Input.GetMouseButtonDown(0))
        {
            RaycastHit hit;
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out hit))
            {
                if (hit.transform.CompareTag("Platform"))
                {
                    Instantiate(currentEnemyPrefab, hit.point, Quaternion.identity).AddComponent<EnemyMovement>();
                }
            }
        }
    }

    public void SetEnemyToSpawn(GameObject enemyPrefab)
    {
        currentEnemyPrefab = enemyPrefab;
    }
}