using UnityEngine;
using System.Collections;

public class PlayerUnit : Unit
{
	public float timer1 = 17f;
	public float timer2 = 17f;
	public float timer3 = 17f;
	
	bool timeS1 = true;
	bool timeS2 = true;
	bool timeS3 = true;
	
	public int fps;
	private AnimationL sprLeft;
	private AnimationR sprRight;
	private SpriteAnimator sprAnim;
	private bool firepress = false;
	public AudioClip jumpSound;

	// Use this for initialization
	public override void Start ()
	{
		sprLeft = GetComponent<AnimationL>();
		sprRight = GetComponent<AnimationR>();
		base.Start ();
	}
	
	// Update is called once per frame
	public override void Update ()
	{
		
		if(timeS1 == false)
		{
			timer1--;
		}
		if(timeS2 == false)
		{
			timer2--;
		}
		if(timeS3 == false)
		{
			timer3--;
		}
		
		if(timer1 <0)
		{
			Destroy(GameObject.FindGameObjectWithTag("Vallend"));
			timeS1 = true;
		}
		if(timer2 <0)
		{
			Destroy(GameObject.FindGameObjectWithTag("Vallend1"));
			timeS2 = true;
		}
		if(timer3 <0)
		{	
			Destroy(GameObject.FindGameObjectWithTag("Vallend2"));
			timeS2 = true;
		}
		
		//movement
		
		move = new Vector3(Input.GetAxis("Horizontal"), 0f, 0f);
		Debug.Log(Input.GetAxis("Horizontal"));
		if(Input.GetAxis("Horizontal") == -1)
		{
			sprRight.Animate(2,5,10,fps);
		}
		if(Input.GetAxis("Horizontal") == 1)
		{
			sprLeft.Animate(2,5,10,-fps);
		}
		move.Normalize();
		
		if(Input.GetKeyDown(KeyCode.W)&& control.isGrounded)
		{
			audio.PlayOneShot(jumpSound);
			jump = true;	
		}
		
		running = Input.GetKey(KeyCode.LeftShift);
		
		if(Input.GetKeyDown(KeyCode.LeftShift))
		{
			fps = 30;	
		}
		
		if(Input.GetKeyUp(KeyCode.LeftShift))
		{
			fps = 24;
		}
		
		base.Update ();
		
		//shoot
		if (Input.GetAxis("Fire1") == 1)
		{
			if(firepress == false)
			{
				GameObject bullet =  Instantiate(Resources.Load("Bullet"),transform.position,transform.rotation) as GameObject;
				firepress = true;
			}
		}
		else
		{
			firepress = false;
		}
	}
	
	void OnControllerColliderHit(ControllerColliderHit hit)
	{
		if (hit.transform.tag == "Spikes") 
		{
			Application.LoadLevel(0);
		}
		if(hit.transform.tag == "EndGame")
		{
			Application.LoadLevel(0);	
		}
		if(hit.transform.tag == "Vallend")
		{
			timeS1 = false;
		}
		if(hit.transform.tag == "Vallend1")
		{
			timeS2 = false;
		}
		if(hit.transform.tag == "Vallend2")
		{
			timeS3 = false;
		}
	}
}

