package Src 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Player extends Unit
	{
		
		private var art:MovieClip;
		public var life:int;
		
		public function Player() 
		{
			art = new PlayerArt();
			addChild(art);
			life = 100;
			
		}
	}
}
