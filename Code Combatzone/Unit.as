package Src
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Unit extends MovieClip
	{

		public function Unit() 
		{
			
		}
		
		public function followTarget($target:Point)
		{
			var xDiff:Number = ($target.x - this.x);
			var yDiff:Number = ($target.y - this.y);
			var radians:Number = Math.atan2(yDiff, xDiff);
			var degrees:Number = radians * 180 / Math.PI;
			this.rotation = degrees;
		}
		
		public function movement($speed:Number)
		{
			var movementSpeed:Point = new Point();
			movementSpeed.x = Math.cos(this.rotation /180 * Math.PI) * $speed;
			movementSpeed.y = Math.sin(this.rotation /180 * Math.PI) * $speed;
			this.x += movementSpeed.x;
			this.y += movementSpeed.y;
		}
	}
	
}
