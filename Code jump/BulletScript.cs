using UnityEngine;
using System.Collections;

public class BulletScript : MonoBehaviour {
	
	public float bulletSpeed = 50f;
	
	// Use this for initialization
	void Start () {
		Destroy(gameObject, 4f);
	}
	
	// Update is called once per frame
	void Update () {
		transform.position = Vector3.MoveTowards(transform.position, Input.mousePosition, Time.deltaTime * bulletSpeed);
	}
}
