package src 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class Boomstam extends MovieClip
	{
		public var art:MovieClip;
		
		public function Boomstam() 
		{
			art = new BoomstamArt();
			addChild(art);
			
			
		}
		
	}

}