package Actors 
{
	import flash.display.MovieClip;
	import Screens.TweedeLevel;
	import flash.events.Event;
	import flash.display.Stage;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class BewegendPlatform extends MovieClip
	{
		private var bewegendplatformpje:bewegendPlatformImg = new bewegendPlatformImg;
		private var speed:int = 2;
		public function BewegendPlatform() 
		{
			addChild(bewegendplatformpje);
			bewegendplatformpje.y = 450; 
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			var parentvar:MovieClip = parent as MovieClip;
			
			bewegendplatformpje.x += speed;
			
			if (bewegendplatformpje.x >= 220)
			{
				speed = -2;
			}
			else if (bewegendplatformpje.x <= -30 )
			{
				speed = 2;
			}
			
		}
		
	}

}