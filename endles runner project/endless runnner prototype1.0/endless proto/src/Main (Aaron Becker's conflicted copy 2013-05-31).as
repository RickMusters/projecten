package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Aaron
	 * 
	 * Prototype 1.0 
	 * 23/05/13
	 * 10:51 Amsterdam.
	 * 
	 *  
	 */
	
	 
	 
	public class Main extends Sprite 
	{
		public var levels:LevelClass;
		public var platformen:ObstaclesClass;
		private var Kup:Boolean = false;
		private var Kdown:Boolean = false;
		
		public function Main():void 
		{
			levels = new LevelClass();
			platformen = new ObstaclesClass();
			addChild(levels);
			addChild(platformen);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyuphandler);
		}
		
		private function keyuphandler(e:KeyboardEvent):void 
		{
			
			//bij aanpassing beide keyhandlers aanpassen.
			
			if (e.keyCode == 38) //87 = w  //32 = space //up arrow = 38
			{
				Kup = false;
			}
			
		}
		
		private function keydownhandler(e:KeyboardEvent):void 
		{
			if (e.keyCode == 38) //87 = w  //32 = space //up arrow = 38
			{
				Kup = true;
			}
		}
		
		private function loop(e:Event):void
		{
			if (Kup)
			{
				levels.playerjump();
			}
			else if (Kup == false)
			{
				levels.playerfall();
			}
			levels.update();
			levels.playerhit();
			platformen.playerhit();
			
			platformen.update();
		}
		
	}
	
}