package Actors 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Block extends MovieClip
	{
		private var blockImg:BlokImg = new BlokImg;
		private var speed:int = 7;
		public var speedGrade:String = "slow";
		
		
		
		public function Block(xpos:Number = 400, ypos:Number = 100) 
		{
			this.x = xpos;
			this.y = ypos;
			addChild(blockImg);
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			
			var parentvar:MovieClip = parent as MovieClip;
			
			blockImg.y += speed;
			
			if (blockImg.y <= 0)
			{
				if (speedGrade == "slow")
				{
					speed = 4;
				}
				else if (speedGrade == "normal")
				{
					speed = 7;
				}
				else if (speedGrade == "fast")
				{
					speed = 10;
				}
			}
			else if (blockImg.y >= 300 )
			{
				if (speedGrade == "slow")
				{
					speed = -2;
				}
				else if (speedGrade == "normal")
				{
					speed = -5;
				}
				else if (speedGrade == "fast")
				{
					speed = -7;
				}
			}
		}
		
	}

}