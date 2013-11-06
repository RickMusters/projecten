package src
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class Main extends MovieClip
	{
		var player:Player;
		public function Main() 
		{
			player = new Player
			addChild(player);
		}
		
	}

}