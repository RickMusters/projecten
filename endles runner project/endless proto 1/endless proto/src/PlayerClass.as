package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class PlayerClass extends MovieClip
	{
		private var run:chickwalkk = new chickwalkk();
		public var isJumping:Boolean = false;
		public var jumpSpeed:int = 0;
		public var gravity:int = 2;
		public var sliding:Boolean = false;
		
		public function PlayerClass() 
		{
			addChild(run);
			run.stop();
			run.y = 420;
			run.x = 120;
		}
		
		public function jump():void
		{
			jumpSpeed = -20; //30
			isJumping = true;
			
		}
		public function Slide():void
		{
			if (sliding)
			{
				//this.gotoAndStop(2);
			}
			
			if (!sliding)
			{
				//this.gotoAndStop(1);
			}
		}
		
		
		
	}

}