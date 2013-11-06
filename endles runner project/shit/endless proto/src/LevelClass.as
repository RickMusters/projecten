package  
{
	import flash.display.MovieClip;
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
		public var obstacle:ObstacleClass = new ObstacleClass();
		public var obstacle1:ObstacleClass = new ObstacleClass();
		
		public function LevelClass() 
		{
			
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
	
			addChild(BF);
			addChild(BF2);
			//addChild(backgrounddark);
			//addChild(backgrounddark2);
			
			
			addChild(pla);	
			addChild(pla2);
			addChild(obstacle);
			addChild(Monster1);
			addChild(player);
		}
		
		public function update():void
		{
			obstacle.x -= 9*factor;
			BF.x -= 2*factor;  //10
			BF2.x -= 2*factor; //10
			//backgrounddark.x -= 2*factor;
			//backgrounddark2.x -= 2*factor;
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
			
			//-------------------------------------------
			
			//if (backgrounddark.x  <-400)
			//{
			//	backgrounddark.x = backgrounddark2.x +800; //<---- was backgroundaarde
			//}
			// if (backgrounddark2.x  <-400)
			//{
				//backgrounddark2.x = backgroundaarde2.x +800; //<---- was backgroundaarde
			//}
			
			
			
			if (pla.x  <-400)
			{
				pla.x = pla2.x +800;
			}
			 if (pla2.x  <-400)
			{
				pla2.x = pla.x +800;
			}
			
			if (player.hitTestObject(obstacle) && contains(player))
			{
				removeChild(player);
			}
			
		}
		
		public function monsterdied():void
		{
			if (player.sliding == true && player.hitTestObject(Monster1))
			{
				Monster1.monsterhit = true;
				
			}
			
			if (Monster1.y > 680 &&contains(Monster1))
			{
				removeChild(Monster1);
			}
		}
		
		public function monsterSpawn():void
		{
			addChild(Monster1);
		}
		

	}

}