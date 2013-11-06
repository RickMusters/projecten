package  
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author rick / Aaron
	 */
	public class LevelClass extends MovieClip
	{
		private var backgroundlava:Lava;
		
		private var backgroundsneeuw:Sneeuw;
		
		
		
		public var pll:Platformlava;
		
		public var platformpje:Platform1;
		
		private var pls:Platformsneeuw;
		
		public var player:PlayerClass;
		
		//whether or not the main guy is jumping
		private var mainJumping:Boolean = false;
		//how quickly should the jump start off
		private var jumpSpeedLimit:int = 30;  //was eerst 15
		//the current speed of the jump;
		private var jumpSpeed:Number = jumpSpeedLimit;
		
		
		public function LevelClass() 
		{
			player = new PlayerClass();
			backgroundsneeuw = new Sneeuw();
			backgroundlava = new Lava();
			pll = new Platformlava();
			pls = new Platformsneeuw();
			
			backgroundsneeuw.y = 300;
			backgroundsneeuw.x = 2400;
			backgroundlava.y = 300;
			backgroundlava.x = 800;
			
			
			
			
			
			pll.x = 800;
			pll.y = 600;
			pls.x = 2650;
			pls.y = 585;
			
			player.y = 540;
			player.x = 120;
			
			
			
			
			addChild(backgroundlava);
			addChild(backgroundsneeuw);
			
			addChild(pll);	
			addChild(pls);
			addChild(player);
		}
		
		public function update():void
		{
			backgroundlava.x -= 10;
			backgroundsneeuw.x -= 10;
			pll.x -= 10;
			pls.x -= 10;
			
			
			if (backgroundlava.x <= -800)
			{
				backgroundlava.x = backgroundsneeuw.x +1600;
			}
			if (backgroundsneeuw.x <= -800)
			{
				backgroundsneeuw.x = backgroundlava.x +1600;
			}
			
			if (pll.x <= -800)
			{
				pll.x = pls.x +1800;
			}
			if (pls.x <= -800)
			{
				pls.x = pll.x +1800;
			}
			
		}
		
		public function playerjump():void
		{
			player.y -= 10;
		}
		
		public function playerfall():void
		{
			player.y += 10;
		}
		
		public function playerhit():void
		{
			if (pll.hitTestPoint(player.x, player.y, false))
			{
				player.y -= 10;
			}
			else if (pls.hitTestPoint(player.x, player.y, false))
			{
				player.y -= 10;
			}
			
			
		}
	}

}