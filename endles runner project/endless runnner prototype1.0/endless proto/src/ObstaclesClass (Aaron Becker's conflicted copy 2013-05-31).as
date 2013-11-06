package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Aaron
	 */
	public class ObstaclesClass extends MovieClip
	
	
	{
				public var platformpje:Platform1;
				
				public var platformtwee:Platform2;
				
				public var platformdrie:Platform3;
				
				public var player:PlayerClass;
				
		public function ObstaclesClass() 
		{
			player = new PlayerClass();
			
			platformpje = new Platform1();
			
			platformtwee = new Platform2();
			
			platformdrie = new Platform3();
			
			platformpje.x = 750;
			platformpje.y = 200;
			
			platformtwee.x = 300;
			platformtwee.y = 150;
			
			platformdrie.x = 350;
			platformdrie.y = 500;
			
			addChild(platformpje);
			addChild(platformtwee);
			addChild(platformdrie);
		}
		
		public function update():void
		{
		platformpje.x -= 10;
		platformtwee.x -= 20;
		platformdrie.x -= 15;
		
			if (platformpje.x <= -800)
			{
				platformpje.x = platformtwee.x +1600;
			}
			if (platformtwee.x <= -800)
			{
				platformtwee.x = platformpje.x +1600;
			}
			if (platformdrie.x <= -800)
			{
				platformdrie.x = platformtwee.x +1600;
			}
		}
		
		
		
		//hittest geval zit hier:
		
		public function playerhit():void
		{
			if (platformpje.hitTestPoint(player.x, player.y, false))
			{
				player.y -= 10;
			}

			if (platformtwee.hitTestPoint(player.x, player.y, false))
			{
				player.y -= 10;
			}
		}
		
		}
		
	}

