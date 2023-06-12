using UnityEngine;

public class CameraMovement : MonoBehaviour
{
    [SerializeField] private Camera cam;
    [SerializeField] private Transform target;
    [SerializeField] private float distanceToTarget = 10;
    [SerializeField] private float zoomSteps = 1;
    [SerializeField] private float maxZoomDistance = 30;
    [SerializeField] private float minZoomDistance = 7;
    [SerializeField] private float maxXAngle = 80;
    private float topAngle = 89;
    private Vector3 previousPosition;

    private void Update()
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

            cam.transform.position = target.position;

            cam.transform.Rotate(new Vector3(1, 0, 0), rotationAroundXAxis);
            //if (cam.transform.rotation.eulerAngles.x >= topAngle - maxXAngle && cam.transform.rotation.eulerAngles.x <= topAngle)
            //{
            //    cam.transform.Rotate(new Vector3(1, 0, 0), rotationAroundXAxis);
            //}
            //else
            //{
            //    if(cam.transform.rotation.eulerAngles.x >= topAngle - maxXAngle)
            //        cam.transform.rotation = Quaternion.Euler(topAngle, cam.transform.rotation.eulerAngles.y,0);
            //    else
            //        cam.transform.rotation = Quaternion.Euler(topAngle - maxXAngle, cam.transform.rotation.eulerAngles.y, 0);
            //}

            cam.transform.Rotate(new Vector3(0, 1, 0), rotationAroundYAxis, Space.World);

            cam.transform.Translate(new Vector3(0, 0, -distanceToTarget));

            previousPosition = newPosition;
        }

        if(Input.GetAxis("Mouse ScrollWheel") < 0)
        {
            distanceToTarget += zoomSteps;
            if(distanceToTarget >= maxZoomDistance)
            {
                distanceToTarget = maxZoomDistance;
                cam.transform.position = target.position;
                cam.transform.Translate(new Vector3(0, 0, -distanceToTarget));
            }
            else
            {
                cam.transform.Translate(new Vector3(0, 0, -zoomSteps));
            }
        }
        if (Input.GetAxis("Mouse ScrollWheel") > 0)
        {
            distanceToTarget -= zoomSteps;
            if (distanceToTarget <= minZoomDistance)
            {
                distanceToTarget = minZoomDistance;
                cam.transform.position = target.position;
                cam.transform.Translate(new Vector3(0, 0, -distanceToTarget));
            }
            else
            {
                cam.transform.Translate(new Vector3(0, 0, +zoomSteps));
            }
        }
    }
}