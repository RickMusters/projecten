package  
{
	/**
	 * ...
	 * @author rick
	 */
	public class MonsterClass extends Monster
	{
		public var monsterhit:Boolean = false;
		public function MonsterClass() 
		{
			this.y = 380;
			this.x = 600;
		}
		
		public function forward():void
		{ 
			if (this.x < -300)
			{
				this.x = 810;
			}
			
			this.x -= 5;
			
			if (monsterhit)
			{
				this.y += 45;
			}
		}
		
		
	}

}