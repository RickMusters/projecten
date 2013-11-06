package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class ObstacleClass extends Obstacle
	{
		
		public function ObstacleClass() 
		{
			this.x = 860;
			this.y = 430;
			
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