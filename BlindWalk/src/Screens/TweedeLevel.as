package Screens 
{
	import Actors.Platform;
	import flash.display.MovieClip;
	import Actors.player;
	import flash.events.Event;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class TweedeLevel extends MovieClip
	{
		private var thePlayer:player = new player;
		private var levelTwee:Level2 = new Level2;
		private var platformlopen:Platform = new Platform;
		private var platformlopen2:Platform = new Platform;
		public var onGround:Boolean = false;
		
		public function TweedeLevel() 
		{
			addChild(thePlayer);
			addChild(levelTwee);
			addChild(platformlopen);
			addChild(platformlopen2);
			
			levelTwee.x = 400;
			levelTwee.y = 405;
			
			platformlopen.x = -200;
			platformlopen2.x = 1000;
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			function loop(e:Event):void
			{
				trace(onGround);
				if (thePlayer.hitTestObject(platformlopen) || thePlayer.hitTestObject(platformlopen2)) 
				{
					onGround = true;
				}
				else
				{
					trace("hgf");
					onGround = false;
				}
			}
		}
		
	}

}