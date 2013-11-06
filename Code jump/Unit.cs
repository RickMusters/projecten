using UnityEngine;
using System.Collections;

[RequireComponent(typeof(CharacterController))]

public class Unit : MonoBehaviour
{
	public AnimationL sprLeft;
	public AnimationR sprRight;
	public CharacterController control;
	
	protected Vector3 move = Vector3.zero;
	
	public float walkSpeed = 10f;
	public float runSpeed = 15f;
	public float jumpSpeed = 5f;
	public float fGravity = 20f;
	
	protected bool jump;
	protected bool running;
	
	protected Vector3 gravity = Vector3.zero;
	
	public virtual void Start()
	{
		control = GetComponent<CharacterController> ();
		if (!control) {
			Debug.LogError ("Unit.start() " + name + " has no CharacterController!");
			enabled = false;	
		}
	}

	public virtual void Update()
	{
		//control.SimpleMove(move * moveSpeed);
		if(running)
		{
			move *= runSpeed;	
		}
		else
		{
			move *= walkSpeed;
		}
		
		if(!control.isGrounded)
		{
			gravity += Physics.gravity * Time.deltaTime * fGravity;	
		}
		else
		{
			gravity = Vector3.zero;	
			
			if(jump)
			{
				gravity.y = jumpSpeed;
				jump = false;
			}
		}
		
		move += gravity;
		
		control.Move(move * Time.deltaTime);

	}
}
