package  
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Theedoek
	 */
	public class ButtonClass extends MovieClip
	{
		public var button:restart = new restart();
		public var restartNow:Boolean = false;
		
		public function ButtonClass() 
		{
			button.y = 480;
			button.x = 575;
			
			addChild(button);
			
			
			stop();
			button.addEventListener(MouseEvent.CLICK, clicked)
			
			
			function clicked(event:MouseEvent):void
			{
				//var myLoader: Loader = new Loader;
				//
				//addChild(myLoader);
				//var url:URLRequest = new URLRequest("endlessproto.swf");
				//myLoader.load(url);
				restartNow = true;
			}
		}
		
		
	}

}