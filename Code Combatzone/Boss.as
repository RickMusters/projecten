package Src 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class Boss extends Unit
	{
		public var life:int;
		public var shootTimer:Timer;
		private var art:MovieClip;
		
		public function Boss() 
		{
			art = new BossArt();
			addChild(art);
			shootTimer = new Timer(1000, 0);
			shootTimer.start();
			shootTimer.addEventListener(TimerEvent.TIMER, shoot);
			life = 500;
		}
		
		private function shoot(e:TimerEvent)
		{
			dispatchEvent(new Event("shoot now"));
		}
		
		public function destroy()
		{
			shootTimer.stop()
			shootTimer.removeEventListener(TimerEvent.TIMER, shoot);
		}
	}
}
