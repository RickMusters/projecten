package  
{
	/**
	 * ...
	 * @author rick
	 */
	public class MonsterClass extends blobblob
	{
		public var monsterhit:Boolean = false;
		public function MonsterClass() 
		{
			this.y = 480;
			this.x = 850;
		}
		
		public function forward():void
		{ 
			//if (monsterhit)
			//{
				//this.y += 45;
			//}
		}
		
		public function update (_factor:Number):void 
		{
			this.x -= 6 * _factor;//snelheid
		}
		
		
	}

}