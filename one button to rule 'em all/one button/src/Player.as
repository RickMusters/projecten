package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class Player extends MovieClip
	{
		private var art:MovieClip; 
		
		public function Player() 
		{
			art = new PlayerArt;
			addChild(PlayerArt);
		
		}
		
	}

}