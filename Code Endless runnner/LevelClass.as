package  
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author rick
	 */
	public class LevelClass extends MovieClip
	{
		private var BF:backgroundfinal = new backgroundfinal();
		private var BF2:backgroundfinaleen = new backgroundfinaleen();
		private var pla:platformfinal = new platformfinal();
		private var pla2:platformfinal = new platformfinal();
		public var factor:Number = 1;
		public var player:PlayerClass = new PlayerClass();
		public var Monster1:MonsterClass = new MonsterClass();
		public var fallbool:Boolean = false;
		public var playercol:int = 90;
		//public var obstacle:ObstacleClass = new ObstacleClass();
		//public var obstacle1:ObstacleClass = new ObstacleClass();
		private var obstacles:Array = [];
		private var monsters:Array = [];
		public var playerDead: Boolean = false;
		public var spawnTimer:Timer;
		public var spawnTimer1:Timer;
		private var obstaclesSpawned:int = 0;
		private var monsterSpawned:int = 0;
		public var monsterScore:int = 0;
		private var timer:int = 3000;
		private var timer1:int = 3000;
		public function LevelClass() 
		{	
			spawnTimer	= new Timer(2500);//timer voor obstakel spawn
			spawnTimer1	= new Timer(2000);//timer voor monster spawn
			
			spawnTimer1.addEventListener(TimerEvent.TIMER, spawn1);
			spawnTimer.addEventListener(TimerEvent.TIMER, spawn);
			//spawnTimer.start();
			//spawnTimer1.start();
		
			
			
			
			BF.y = 300;
			BF.x = 1000;
			BF2.y = 300;
			BF2.x = 400;
			//backgrounddark.y = 300;
			//backgrounddark.x = 1000;
			//backgrounddark2.y = 300;
			//backgrounddark2.x = 400;
			
			pla.x = 400;
			pla.y = 540;
			pla2.x = 1000;
			pla2.y = 540;
	
			addChild(BF)
			addChild(BF2)
			//addChild(backgrounddark);
			//addChild(backgrounddark2);
			
			
			addChild(pla);	
			addChild(pla2);
			//addChild(obstacle);
			
			
		

			
			addChild(player);
		}
		
		
		private function spawn1(e:TimerEvent):void //timed hoevaak het monster gespawnd word
		{
			monsters.push(new MonsterClass());
			
			addChild(monsters[monsters.length -1]);
			
			monsterSpawned += 10;
			spawnTimer1.delay -= monsterSpawned * 1;
		}
		
		private function spawn(e:TimerEvent):void //timed hoe vaak de obstakels gespawnd worden
		{
			obstacles.push(new ObstacleClass());
			
			addChild(obstacles[obstacles.length - 1]);
			
			obstaclesSpawned ++;
			
			spawnTimer.delay -= obstaclesSpawned * 1; 
			
			
		}
		
		public function update():void// houd alle snelheiden bij en hittests
		{

			//obstacle.x -= 9*factor;
			trace(monsterScore);
			
			for (var j:int = 0; j < monsters.length; j++) 
			{
				
				monsters[j].update(factor)
				
				
				if (player.sliding == true && player.hitTestObject(monsters[j]))
				{
					monsters[j].monsterhit = true;
				
				}
				
				if (monsters[j].hitTestPoint(player.x, player.y))
				{
					playerDead = true;
				}
				
				if (monsters[j].monsterhit == true)
				{
					monsterScore += 10;
				}
			
				if (monsters[j].x < -400 ||	monsters[j].monsterhit == true )
				{
					removeChild(monsters[j]);
					monsters.splice(j, 1);
				}
			}
			//trace(spawnTimer.currentCount);
			//trace(spawnTimer1.currentCount);
			for (var i:int = 0; i < obstacles.length; i++) 
			{
				obstacles[i].update(factor);
				
				if (obstacles[i].hitTestPoint(player.x ,player.y - playercol))
				{
					playerDead = true;
				}
				if (obstacles[i].hitTestPoint(player.x, player.y))
				{
					playerDead = true;
				}
				
				if (obstacles[i].x < -400)
				{
					removeChild(obstacles[i]);
					obstacles.splice(i, 1);
				}
			}
			
			
			
			BF.x -= 2*factor;  //10
			BF2.x -= 2*factor; //10
			pla.x -= 9*factor; //8  //-
			pla2.x -= 9*factor; //8  //-
		
			
			
			if (BF2.x  <-400)
			{
				BF2.x = BF.x +800; //<---- was backgroundaarde
			}
			 if (BF.x  <-400)
			{
				BF.x = BF2.x +800; //<---- was backgroundaarde
			}
			
			if (pla.x  <-400)
			{
				pla.x = pla2.x +800;
			}
			 if (pla2.x  <-400)
			{
				pla2.x = pla.x +800;
			}
			
			
			
			//if (killPlayer)
			//{
				//removeChild(player);
				//player = null;
			//}
			
		}
		
		

	}

}