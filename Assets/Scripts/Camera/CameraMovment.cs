using UnityEngine;

public class CameraMovement : MonoBehaviour
{
    [SerializeField] private Camera cam;
    [SerializeField] private GameObject target;
    [SerializeField] private float zoomHeight = 10;
    [SerializeField] private float zoomSteps = 1;
    [SerializeField] private float maxZoomDistance = 30;
    [SerializeField] private float minZoomDistance = 7;
    [SerializeField] private float maxXAngle = 80f;
    [SerializeField] private float minXAngle = 15f;
    [SerializeField] private float movementSpeed = 10f;
    [SerializeField] private LayerMask cameraCollider;
    private Vector3 previousPosition;

    private void Update()
    {
        HandleCameraRotation();
        HandleCameraZoom();
        HandleCameraMovement();
    }

    private void HandleCameraRotation()
    {
        if (Input.GetMouseButtonDown(2))
        {
            previousPosition = cam.ScreenToViewportPoint(Input.mousePosition);
        }
        else if (Input.GetMouseButton(2))
        {
            Vector3 newPosition = cam.ScreenToViewportPoint(Input.mousePosition);
            Vector3 direction = previousPosition - newPosition;

            float rotationAroundYAxis = -direction.x * 180; // camera moves horizontally
            float rotationAroundXAxis = direction.y * 180; // camera moves vertically

            // Limit the X-rotation between 0 and 90 degrees
            float currentXRotation = cam.transform.rotation.eulerAngles.x;
            float angle = maxXAngle;
            float clampedXRotation = Mathf.Clamp(currentXRotation + rotationAroundXAxis, 0f, angle);
            rotationAroundXAxis = clampedXRotation - currentXRotation;

            cam.transform.position = target.transform.position;
            cam.transform.Rotate(new Vector3(1, 0, 0), rotationAroundXAxis);
            cam.transform.Rotate(new Vector3(0, 1, 0), rotationAroundYAxis, Space.World);

            cam.transform.Translate(new Vector3(0, 0, -zoomHeight));

            previousPosition = newPosition;
        }
    }

    private void HandleCameraZoom()
    {
        float zoomInput = Input.GetAxis("Mouse ScrollWheel");

        zoomHeight -= zoomInput * zoomSteps;
        zoomHeight = Mathf.Clamp(zoomHeight, minZoomDistance, maxZoomDistance);

        Vector3 newPosition = target.transform.position - cam.transform.forward * zoomHeight;

        Collider[] colliders = Physics.OverlapSphere(newPosition, 0.5f, cameraCollider);
        bool collided = false;
        foreach (Collider collider in colliders)
        {
            if (collider.CompareTag("CameraCollider"))
            {
                collided = true;
                break;
            }
        }

        if (!collided)
        {
            cam.transform.position = newPosition;
        }
    }

    private void HandleCameraMovement()
    {
        float horizontalInput = Input.GetAxis("Horizontal");
        float verticalInput = Input.GetAxis("Vertical");

        // Get camera's forward direction on the x-z plane
        Vector3 forwardDirection = cam.transform.forward;
        forwardDirection.y = 0;
        forwardDirection.Normalize();

        // Get camera's right direction on the x-z plane
        Vector3 rightDirection = cam.transform.right;
        rightDirection.y = 0;
        rightDirection.Normalize();

        // Calculate movement vector
        Vector3 movement = (forwardDirection * verticalInput + rightDirection * horizontalInput) * movementSpeed * Time.deltaTime;
        Vector3 newPosition = target.transform.position + movement;

        // Check for collision with CameraCollider objects
        Collider[] colliders = Physics.OverlapSphere(newPosition, 0.5f, cameraCollider);
        bool collided = false;
        foreach (Collider collider in colliders)
        {
            if (collider.CompareTag("CameraCollider"))
            {
                collided = true;
                break;
            }
        }

        if (!collided)
        {
            target.transform.position = newPosition;
        }
    }
}