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
			
			pla.x = 400;
			pla.y = 464;
			pla2.x = 1000;
			pla2.y = 464;
			
			obstacle1.y = 360;
			obstacle1.x = 540;
	
			addChild(backgroundaarde);
			addChild(backgroundaarde2);
			
			
			addChild(pla);	
			addChild(pla2);
			addChild(obstacle);
			addChild(obstacle1);
			addChild(Monster1);
			addChild(player);
		}
		
		public function update():void
		{
			obstacle.x -= 8;
			obstacle1.x -= 8;
			backgroundaarde.x -= 10;
			backgroundaarde2.x -= 10;
			pla.x -= 8;
			pla2.x -= 8;
		
			if (backgroundaarde2.x  <-400)
			{
				backgroundaarde2.x = backgroundaarde.x +800;
			}
			 if (backgroundaarde.x  <-400)
			{
				backgroundaarde.x = backgroundaarde2.x +800;
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
			
			if (player.hitTestObject(obstacle1) && contains(player))
			{
				removeChild(player);
			}
			
			
			if (obstacle1.x < -400)
			{
				obstacle1.x = 810;
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