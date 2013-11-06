package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author rick
	 */
	public class Main extends Sprite 
	{
		private var levels:LevelClass;
		private var scoreText:TextField = new TextField;
		private var myFormat:TextFormat = new TextFormat;
		public var score:int;
		
		
		[Embed(source = "../lib/runner.mp3")]
		private var mySound: Class;
		private var sound:Sound;
		
		public function Main():void 
		{
			sound = (new mySound) as Sound;
			sound.play();
			super();
			
			
			
			addChild(scoreText);
			
			scoreText.x = 20;
			scoreText.y = 20;
			scoreText.width = 500;
			myFormat = new TextFormat("Verdana", 30, 0xff8800, true);
			scoreText.setTextFormat(myFormat);
			
			levels = new LevelClass();
			addChild(levels);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyuphandler);
		}
		
		private function keyuphandler(e:KeyboardEvent):void 
		{
			if (e.keyCode == 83)
			{
				levels.player.sliding = false;
			}
			if (e.keyCode == 17)
			{
				levels.player.sliding = false;
			}
		}
		
		private function keydownhandler(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)
			{
				if (levels.player.isJumping != true)
				{
					levels.player.jump();
				}
			}
			if (e.keyCode == 17)
			{
				levels.player.sliding = true;
			}
			
		}
		
		
		private function loop(e:Event):void
		{
			 if (getChildIndex (scoreText) < numChildren - 1) 
			 { 
				 setChildIndex (scoreText, numChildren - 1); 
			 }
			scoreText.text = ("Score: " + score);
			scoreText.setTextFormat(myFormat);
			score+=1;
			
			
			
			if (score % 100 == 0 ) levels.factor += 0.1;
			
			//trace(levels.player.isJumping);
			if (levels.player.isJumping)
			{
				levels.player.y += levels.player.jumpSpeed;
				levels.player.jumpSpeed += levels.player.gravity;
				
				if (levels.player.y >= 473)
				{
					levels.player.isJumping = false;
					levels.player.y = 475;
				}
			}
			
			levels.player.Slide();
			levels.update();
			levels.Monster1.forward();
			levels.monsterdied();
			levels.obstacle.update();
			
			
			
		}
		
	}
	
}