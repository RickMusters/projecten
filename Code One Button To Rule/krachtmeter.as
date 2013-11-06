package	src  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class krachtmeter extends MovieClip
	{
		private var art:MovieClip;
		
		public function krachtmeter() 
		{
			art = new KrachtArt();
			addChild(art);
			
		}
		
	}

}