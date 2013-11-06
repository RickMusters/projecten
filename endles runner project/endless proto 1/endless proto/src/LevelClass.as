package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick
	 */
	public class LevelClass extends MovieClip
	{
		private var backgroundaarde:Aarde = new Aarde();
		private var backgroundaarde2:Aarde = new Aarde();
		private var backgrounddark:Dark = new Dark();
		private var backgrounddark2:Dark = new Dark();
		private var pla:Platformaarde = new Platformaarde();
		private var pla2:Platformaarde = new Platformaarde();
		private var pld:Platformdark = new Platformdark();
		private var pld2:Platformdark = new Platformdark();
		public var factor:Number = 1;
		public var player:PlayerClass = new PlayerClass();
		public var Monster1:MonsterClass = new MonsterClass();
		public var fallbool:Boolean = false;
		public var obstacle:ObstacleClass = new ObstacleClass();
		public var obstacle1:ObstacleClass = new ObstacleClass();
		
		public function LevelClass() 
		{
			
			backgroundaarde.y = 300;
			backgroundaarde.x = 1000;
			backgroundaarde2.y = 300;
			backgroundaarde2.x = 400;
			backgrounddark.y = 300;
			backgrounddark.x = 1000;
			backgrounddark2.y = 300;
			backgrounddark2.x = 400;
			
			pla.x = 400;
			pla.y = 464;
			pla2.x = 1000;
			pla2.y = 464;
	
			addChild(backgroundaarde);
			addChild(backgroundaarde2);
			addChild(backgrounddark);
			addChild(backgrounddark2);
			
			
			addChild(pla);	
			addChild(pla2);
			addChild(obstacle);
			addChild(Monster1);
			addChild(player);
		}
		
		public function update():void
		{
			obstacle.x -= 9*factor;
			backgroundaarde.x -= 2*factor;  //10
			backgroundaarde2.x -= 2*factor; //10
			backgrounddark.x -= 2*factor;
			backgrounddark2.x -= 2*factor;
			pla.x -= 9*factor; //8  //-
			pla2.x -= 9*factor; //8  //-
		
			
			
			if (backgroundaarde2.x  <-400)
			{
				backgroundaarde2.x = backgroundaarde.x +800; //<---- was backgroundaarde
			}
			 if (backgroundaarde.x  <-400)
			{
				backgroundaarde.x = backgrounddark.x +800; //<---- was backgroundaarde
			}
			
			//-------------------------------------------
			
			if (backgrounddark.x  <-400)
			{
				backgrounddark.x = backgrounddark2.x +800; //<---- was backgroundaarde
			}
			 if (backgrounddark2.x  <-400)
			{
				backgrounddark2.x = backgroundaarde2.x +800; //<---- was backgroundaarde
			}
			
			
			
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