package	src  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class Ondergrond extends MovieClip
	{
		private var art:MovieClip
		
		public function Ondergrond() 
		{
			art = new GrassArt();
			addChild(art);
			
		}
		
	}

}