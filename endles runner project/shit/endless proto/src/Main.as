
package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author rick/ Aaron
	 */
	public class Main extends Sprite 
	{
		private var levels:LevelClass;
		private var buttons:ButtonClass;
		private var scoreText:TextField = new TextField;
		private var myFormat:TextFormat = new TextFormat;
		public var score:int;
	
		//[Embed(source = "../lib/runner.mp3")]
		//private var mySound: Class;
		//private var sound:Sound;
		
		

		
		
		public function Main():void 
		{
			
			init();
			
		}
		
		private function init():void 
		{
			//sound.play();
			
			
			
			
			addChild(scoreText);
			
			scoreText.x = 20;
			scoreText.y = 20;
			scoreText.width = 500;
			myFormat = new TextFormat("Verdana", 30, 0xff8800, true);
			scoreText.setTextFormat(myFormat);
			
			levels = new LevelClass();
			buttons = new ButtonClass();
			addChild(levels);
			addChild(buttons);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyuphandler);
		}
		
		private function keyuphandler(e:KeyboardEvent):void 
		{
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
			
			if (buttons.restartNow)
			{
				trace("restart");
				destroyGame();
				init();
			}
			
			 if (getChildIndex (scoreText) < numChildren - 1) 
			 { 
				 setChildIndex (scoreText, numChildren - 1); 
			 }
			scoreText.text = ("Score: " + score);
			scoreText.setTextFormat(myFormat);
			score+=1;
			
			
			
			if (score % 100 == 0 ) levels.factor += 0.1;
			
			
			if (levels.player.isJumping)
			{
				levels.player.y += levels.player.jumpSpeed;
				levels.player.jumpSpeed += levels.player.gravity;
				
				if (levels.player.y >= 470)
				{
					levels.player.isJumping = false;
					levels.player.y = 471;
				}
			}
			
			levels.player.Slide();
			levels.update();
			levels.Monster1.forward();
			levels.monsterdied();
			levels.obstacle.update();
			
			
			
		}
		
		private function destroyGame():void 
		{
			//myChannel.stop();
			score = 0;
			removeChild(scoreText);
			removeChild(levels);
			removeChild(buttons);
			removeEventListener(Event.ENTER_FRAME, loop);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyuphandler);
		}
		
	}
	
}