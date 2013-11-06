package Src 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class Enemy extends Unit
	{
		 
		public var maxEHP:int;
		public var shootTimer:Timer;
		private var art:MovieClip;
		
		public function Enemy() 
		{
			art = new EnemyArt();
			addChild(art);
			shootTimer = new Timer(2000, 0);
			shootTimer.start();
			shootTimer.addEventListener(TimerEvent.TIMER, shoot);
			maxEHP = 100;
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