using UnityEngine;
using UnityEngine.Rendering.HighDefinition;
public class DecalController : MonoBehaviour
{
    [SerializeField] private float fadeDuration = 60f;

    private Material decalMaterial;
    private Color initialColor;
    private float timer;

    void Start()
    {
        DecalProjector decalProjector = GetComponent<DecalProjector>();
        if (decalProjector != null)
        {
            decalMaterial = new Material(decalProjector.material);
            decalProjector.material = decalMaterial;
            Destroy(gameObject, fadeDuration);
        }
        else
        {
            Debug.LogError("Kein DecalProjector auf dem GameObject gefunden!");
        }
    }

    void Update()
    {
        if (decalMaterial != null)
        {
            timer += Time.deltaTime / fadeDuration;
            decalMaterial.SetFloat("_Opacity", Mathf.Lerp(1f, 0f, timer));
        }
        else
        {
            Debug.Log("no Decal material found!");
        }
    }
}