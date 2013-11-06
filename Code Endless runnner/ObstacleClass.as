package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class ObstacleClass extends obstaclefinal
	{
		
		public function ObstacleClass() 
		{
			this.x = 860;
			switch(Math.ceil(Math.random() * 2))//2 waardes
			{
				case 1://y is 340
					this.y = 340;	
					break;
					
				case 2://y is 450
					this.y = 450;
					break;
			}			
			
			
		}
		
		public function update(_moveFactor:Number):void
		{
			this.x -= 9 * _moveFactor;//snelheid
			
			
			
			//if (this.x < -400)
			//{
				//
				//timesReset++;
				//
				//this.x = 810;
				//
				//
				//
			//}
		}
		
	}

}