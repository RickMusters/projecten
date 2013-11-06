using UnityEngine;
using System.Collections;

public class StartGame : MonoBehaviour {
	public AudioClip buttonSound;

	private void OnMouseDown()
	{
		audio.PlayOneShot(buttonSound);
		Application.LoadLevel(1);	
	}
}
