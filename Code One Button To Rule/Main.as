  package src
{
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author rick
	 */
	public class Main extends MovieClip
	{
		var Score:int;
		private var richtingHeen:Boolean = true;
		private var balkspeed:Number = 15;
		private var zetStil:Boolean = false;
		var arrow:Arrow;
		var player:Player;
		var grond:Ondergrond;
		var enemy:Target;
		var boomstam:Boomstam;
		var fireready:Boolean = false;
		var enemyHealth:Number = 100;
		var wolk:MovieClip;
		var wolkarray:Array = new Array();
		var meter:krachtmeter;
		var balk:Meterbar;
		var arrowTimer:Timer;
		var canFire:Boolean = true;
		var arrowremove:Boolean = true;
		
		
		
		public function Main() 
		{
			meter = new krachtmeter
			balk = new Meterbar;
			wolk = new Wolk();
			arrow = new Arrow
			boomstam = new Boomstam
			player = new Player
			grond = new Ondergrond
			enemy = new Target
			Score = 0;
			arrowTimer = new Timer(400, 1);
			
			stage.addChild(player);
			addChild(meter);
			addChild(balk);
			addChild(enemy);
			addChild(grond);
			addChildAt(boomstam, 0);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, down)
			stage.addEventListener(Event.ENTER_FRAME, wolken)
			stage.addEventListener(Event.ENTER_FRAME, balkmove)
			arrowTimer.addEventListener(TimerEvent.TIMER, arrowHandler);
			
			//positie balk
			balk.x = 50;
			balk.y = 600;
			
			//positie meter
			meter.x = 50;
			meter.y = 600;
			
			
			//positie boomstam
			boomstam.x = 1535;
			boomstam.y = 600;
			
		    
			//positie player
			player.x = 150;
			player.y = 630;
			
			
			
			
			//positie grond
			grond.x = 2000;
			grond.y = 770;
			
			
			//positie enemy
			enemy.x = 1500;
			enemy.y = 645;
			
			
			
			
			for (var i:int = 0; i < 40; i++) 
			{
				trace(wolkarray.length);
				wolkarray[i] = new Wolk();
				addChild(wolkarray[i]);
				wolkarray[i].x = 5000;
				wolkarray[i].y = 250 * Math.random();
			}
			
			
			
			
			
			
			
					
			
		}
		
		private function arrowHandler(e:TimerEvent):void 
		{
			canFire = true;
		}
		
		private function balkmove(e:Event):void 
		{
				
			
			if (!zetStil) {
				trace(Score);
				if (richtingHeen)
				{
					
					balk.y += balkspeed;
					if (balk.y > 725) richtingHeen = false;
				}else
				{
					balk.y -= balkspeed;
					if (balk.y < 443) richtingHeen = true;
				}
			}
		}
		
		private function wolken(e:Event):void 
		{
			for (var i:int = 0; i < wolkarray.length; i++) 
			{
				
				wolkarray[i].x -= 17;// * Math.random();
				if (wolkarray[i].x <= -300)
				{
					wolkarray[i].x = stage.width +400;
				}
			}
		}
		
		
		
		private function down(e:KeyboardEvent):void
		{
			if (e.keyCode == 32)//spatie
				zetStil = true;
				//enter frame functie voor schieten
				if(fireready == false)// positie arrow als bolean false =;
				{
					arrow.x = player.x + 100;
					arrow.y = player.y - 35;
				}
				if (zetStil && canFire)
				{
					stage.addEventListener(Event.ENTER_FRAME, shootArrow);
					canFire = false;
					arrowTimer.start();
				}
				
				
			
				
		}
		
		private function shootArrow(e:Event):void
		{
				
				if (fireready == false)
				{
					addChild(arrow);//voeg arrow toe aan stage als bool false =;
					fireready = true; // zet bool op true zodat we niet de arrow kunnen spammen;
					
				}
				else if(balk.y <500 && balk .y > 435)//y positie van balk
				{
					arrow.x += 30;//slide 30 pixels
					arrow.y -= 15;//slide 10 pixels naar onder
				}
				else if (balk.y <550 && balk.y>500 || balk.y == 550 || balk.y == 500)//y positie van balk
				{
					arrow.x += 30;
					arrow.y -= 0.7;
					if (arrow.hitTestObject(boomstam))
					{
						Score+=10;
					}
					
				}
				else if (balk.y <600 && balk.y >550)
				{
					arrow.x += 30;
					arrow.y += 0;
					if (arrow.hitTestObject(boomstam))
					{
						Score+=50;
					}
				}
				else if (balk.y < 650 && balk.y >600 || balk.y == 650 || balk.y == 600 )//y positie van balk
				{
					arrow.x += 30;
					arrow.y += 0.7;
					if (arrow.hitTestObject(boomstam))
					{
						Score += 10;
					}
					
				}
				else if (balk.y <735 && balk.y > 650)//y positie van balk
				{
					arrow.x += 30;
					arrow.y += 15;
				}
				
				
				
				
				if (arrow.hitTestObject(boomstam))//kijken of de arrow de boomstam raakt
				{
					zetStil = false;
					arrow.x -= 10;//- 10 snelheid
					removeChild(arrow);//verwijder arrow
					stage.removeEventListener(Event.ENTER_FRAME, shootArrow);//verwijder listener
					move();//functie uitvoeren
					
				}
				
				if (arrow.y < -500 && contains(arrow) || arrow.y >1000 && contains(arrow))//y positie van arrow en of die arrow bevat.
				{
					removeChild(arrow);
					zetStil = false;
					fireready = false;
				}
				
		}
		
		public function move():void
		{
			boomstam.x += 100;// 100 opschuiven
			enemy.x += 100;//100 opschuiven
			balkspeed += 2.5;// voegt snelheid aan de balk toe
			fireready = false;//zet bool op false zodat we weer kunnen schieten
		}
		
				
		
		
	}

}