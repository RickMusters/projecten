package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Aaron;
	 * 
	 * Prototype 2.0;
	 * 
	 * Amsterdam, 31/05/13;
	 */
	public class ObstaclesClass extends MovieClip
	
	
	{
		public var platformeen:Platform1; //pje
				
		public var platformtwee:Platform2;
				
		public var platformdrie:Platform3;
				
		public function ObstaclesClass() 
		{
			platformeen = new Platform1(); //pje
			
			platformtwee = new Platform2();
			
			platformdrie = new Platform3();
			
			platformeen.x = 750;
			platformeen.y = 200;
			
			platformtwee.x = 300;
			platformtwee.y = 150;
			
			platformdrie.x = 350;
			platformdrie.y = 500;
			
			addChild(platformeen);
			addChild(platformtwee);
			addChild(platformdrie);
		}
		
		public function update():void
		{
		platformeen.x -= 10;
		platformtwee.x -= 20;
		platformdrie.x -= 15;
		
			if (platformeen.x <= -800)
			{
				platformeen.x = platformtwee.x +1600;
			}
			if (platformtwee.x <= -800)
			{
				platformtwee.x = platformeen.x +1600;
			}
			if (platformdrie.x <= -800)
			{
				platformdrie.x = platformtwee.x +1600;
			}
		}
		
		
		}
		
	}

