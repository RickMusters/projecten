package src  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class Target extends MovieClip
	{
		private var art:MovieClip
		
		public function Target() 
		{
			art = new TargetArt();
			addChild(art);
			
		}
		
	}

}