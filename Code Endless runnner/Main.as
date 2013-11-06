package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Loader;
	
	/**
	 * ...
	 * @author rick
	 */
	public class Main extends Sprite 
	{
		private var levels:LevelClass;
		private var distanceText:TextField = new TextField;
		private var scoreText:TextField = new TextField;
		private var myFormat:TextFormat = new TextFormat;
		public var score:int;
		public var start:Boolean = false;
		public var startKnop:startknop = new startknop();
		public var timerplay:Boolean = true;
		public var replayKnop:replayknop = new replayknop();
		
		
		
		[Embed(source = "../lib/runner.mp3")]
		private var mySound: Class;
		private var sound:Sound;
		private var sc:SoundChannel;
		public function Main():void
		{
			init();
		}
		
		public function init():void // add alles voor het hele spel
		{
			
			
			sound = (new mySound) as Sound;
			
			
			
			addChild(distanceText);
			addChild(scoreText);
			
			
			scoreText.x = 20;
			scoreText.y = 50;
			scoreText.width = 500;
			scoreText.setTextFormat(myFormat);
			
			distanceText.x = 20;
			distanceText.y = 20;
			distanceText.width = 500;
			myFormat = new TextFormat("Verdana", 30, 0xff6600, true);
			distanceText.setTextFormat(myFormat);
			
			levels = new LevelClass();
			addChild(levels);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyuphandler);
			
			startKnop.x = 200;
			startKnop.y = 150;
			
			addChild(startKnop);
			startKnop.gotoAndStop(1);
			replayKnop.gotoAndStop(1);
			
			startKnop.addEventListener(MouseEvent.CLICK, startclick);
			
		}
		
		private function startclick(e:MouseEvent):void //zet boolaen op true zodat het spel kan starten
		{
			startKnop.gotoAndStop(2);
			sc = sound.play();
			start = true;
		}
	
		
		private function keyuphandler(e:KeyboardEvent):void //houd de key up bij
		{
			if (e.keyCode == 83)
			{
				levels.player.sliding = false;//kan niet slide
			}
			if (e.keyCode == 17)
			{
				levels.player.sliding = false;//kan niet slide
			}
		}
		
		private function keydownhandler(e:KeyboardEvent):void //houd de key down bij 
		{
			if (e.keyCode == 32)
			{
				if (levels.player.isJumping != true)
				{
					levels.player.jump();//jump
				}
			}
			if (e.keyCode == 17)
			{
				levels.player.sliding = true;//slide
			}
			
		}
		
		
		private function loop(e:Event):void// een loop event dat doorgaat tot dat het spel stopt
		{
			if (start && contains(startKnop))//start knop weg halen
			{
				removeChild(startKnop);
				startKnop.removeEventListener(MouseEvent.CLICK, startclick);
			}
			
			if (levels.player.sliding)//slide
			{
				levels.playercol = 60;
			}
			else if (!levels.player.sliding)
			{
				levels.playercol = 90;
			}
			
			if(!levels.playerDead && start){//start het spel
			
				
				 if (getChildIndex (distanceText) < numChildren - 1) 
				 { 
					 setChildIndex (distanceText, numChildren - 1); 
				 }
				 
				 if (getChildIndex (scoreText) < numChildren - 1) 
				 { 
					 setChildIndex (scoreText, numChildren - 1); 
				 }
				 
				scoreText.text = ("Score: " + levels.monsterScore);
				scoreText.setTextFormat(myFormat);
				 
				 
				distanceText.text = ("Distance: " + score);
				distanceText.setTextFormat(myFormat);
				score+=1;
				
				
				
				if (score % 100 == 0 )
				{
					levels.factor += 0.1;
				}
				else if (levels.factor == 2)
				{
					levels.factor = 2; 
				}
				
				if (levels.monsterScore % 120 == 0)
				{
					levels.monsterScore += 20;
				}
				    
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
				levels.Monster1.forward();
				levels.update();
				if (timerplay)
				{
					levels.spawnTimer.start();
					levels.spawnTimer1.start();
					timerplay = false;
				}
			
			
			}else
			
			{
				if (levels.playerDead)// stopt het spel
				{
					distanceText.x = 280;
					distanceText.y = 100;
					scoreText.x = 300;
					scoreText.y = 130;
				
				
					addEventListener(Event.ENTER_FRAME, loop);
					stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
					stage.addEventListener(KeyboardEvent.KEY_UP, keyuphandler);
				
					replayKnop.x = 250;
					replayKnop.y = 200;
				
					addChild(replayKnop);
					timerplay = false;
					replayKnop.addEventListener(MouseEvent.MOUSE_DOWN, replayclick)
					sc.stop();
				}
	
			}
		}
		
		private function replayclick(e:MouseEvent):void //start het spel opnieuw op
		{
			levels.monsterScore = 0;
			score = 0;
			removeChild(scoreText);
			removeChild(distanceText);
			removeChild(levels);
			removeChild(replayKnop);
			removeEventListener(Event.ENTER_FRAME, loop);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keydownhandler);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyuphandler);
			start = false;
			levels.playerDead = false;
			timerplay = true;
			levels.spawnTimer.reset();
			levels.spawnTimer1.reset();
			//sound.close();
			init();
		}
		
	}
	
}