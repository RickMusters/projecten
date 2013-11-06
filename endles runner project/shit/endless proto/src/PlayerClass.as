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
		private var slide:chickslidee = new chickslidee();
		private var jumpanim:chickjumpp = new chickjumpp();
		public var isJumping:Boolean = false;
		public var jumpSpeed:int = 0;
		public var gravity:int = 2;
		public var sliding:Boolean = false;
		
		public static const JUMP:String = "jump";
		public static const SLIDE:String = "slide";
		public static const RUN:String = "run";
		
		public function PlayerClass() 
		{
			addChild(run);
			addChild(slide);
			addChild(jumpanim);
			playAnim(PlayerClass.RUN);
			
			run.play();
			
			this.x = 120;
			this.y = 475;
			//run.y = 475;
			//run.x = 120;
		}
		
		private function playAnim(_anim:String):void
		{
			switch(_anim)
			{
				case PlayerClass.SLIDE:						//SLIDE
				slide.visible = true;
				run.visible = false;	
				jumpanim.visible = false;
				slide.gotoAndPlay(1);
				break;
				case PlayerClass.RUN:						//RUN
				slide.visible = false;
				run.visible = true;	
				jumpanim.visible = false;	
				run.gotoAndPlay(1);
				break;
				case PlayerClass.JUMP:						//JUMP
				slide.visible = false;
				run.visible = false;	
				jumpanim.visible = true;
				jumpanim.gotoAndPlay(1);
				break;
			}
			
		}
		
		public function jump():void{
			jumpSpeed = -35; //30
			isJumping = true;
			playAnim(PlayerClass.JUMP);
			
		}
		public function Slide():void
		{
		
			if (sliding && !slide.visible)
			{
				playAnim(PlayerClass.SLIDE);
				
			}			
			if (!sliding && !run.visible && !isJumping)
			{
				playAnim(PlayerClass.RUN);
			}
			
		}
		
		
		
	}

}