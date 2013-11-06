package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class ObstacleClass extends vuur
	{
		
		public function ObstacleClass() 
		{
			this.x = 420;
			this.y = 380;
			
		}
		
		public function update():void
		{
			if (this.x < -400)
			{
				this.x = 810;
			}
		}
		
	}

}