using UnityEngine;
using System.Collections;

public class PlayerMovement : MonoBehaviour {
	
	private bool jumped = false;
	private bool firepress = false;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		
		if (Input.GetKey(KeyCode.S))
		{
			rigidbody.AddForce(new Vector3(0, 50, 0));	
		}
		
		else if (Input.GetKey(KeyCode.A))
		{
			rigidbody.AddForce(new Vector3(-50, 0, 0));
		}
		if (Input.GetKey(KeyCode.D))
		{
			rigidbody.AddForce(new Vector3(50, 0, 0));
		}
		
		if (Input.GetKey(KeyCode.W))
		{
			if(jumped == false)
			{
				jumped = true;
				rigidbody.AddForce(new Vector3(0, 1000, 0));
			}
		}
		if (Input.GetAxis("Fire1") == 1)
		{
			if(firepress == false)
			{
				GameObject bullet = Instantiate(Resources.Load("Bullet"),transform.position,transform.rotation) as GameObject;
				firepress = true;
			}
		}
		else
		{
			firepress = false;
		}
	}
	void OnCollisionEnter(Collision col)
	{
		if(col.collider.name == "Platforms")
		{
			jumped = false;
		}
	}
}