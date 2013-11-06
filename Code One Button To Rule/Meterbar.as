package src 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class Meterbar extends MovieClip
	{
		private var art:MovieClip;
		public function Meterbar() 
		{
			art = new MeterBarArt();
			addChild(art);
			
		}
		
	}

}