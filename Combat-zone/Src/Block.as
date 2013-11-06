package Src 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Block extends Unit
	{
		public var life:int;
		private var art:MovieClip;
		
		public function Block() 
		{
			art = new BlockArt();
			art.x = 465;
			art.y = 210;
			life = 100;
			addChild(art);
			
		}
	}
}