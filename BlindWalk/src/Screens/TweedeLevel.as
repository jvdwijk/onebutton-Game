package Screens 
{
	import Actors.Platform;
	import flash.display.MovieClip;
	import Actors.player;
	import flash.events.Event;
	import Actors.BewegendPlatform;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class TweedeLevel extends MovieClip
	{
		private var thePlayer:player = new player(30,370);
		private var levelTwee:Level2 = new Level2;
		private var platformlopen:Platform = new Platform;
		private var platformlopen2:Platform = new Platform;
		public var onGround:Boolean = false;
		public var pushback:Boolean = true;
		private var beweging:BewegendPlatform = new BewegendPlatform;
		
		public function TweedeLevel() 
		{			
			addChild(thePlayer);
			addChild(levelTwee);
			addChild(platformlopen);
			addChild(platformlopen2);
			addChild(beweging);
			
			levelTwee.x = 400;
			levelTwee.y = 405;
			
			platformlopen.x = -200;
			platformlopen2.x = 1000;
			beweging.x = 300;
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			function loop(e:Event):void
			{
				if (thePlayer.x >= 788)
				{
					removeChild(thePlayer);
					removeChild(levelTwee);
					removeChild(platformlopen);
					removeChild(platformlopen2);
					removeChild(beweging);
				}
				if (thePlayer.dead == true)
				{
					thePlayer.dead = false;
					removeChilds();
				}
				
				//speler tegen grond #gravity
				if (thePlayer.hitTestObject(platformlopen) || thePlayer.hitTestObject(platformlopen2) || thePlayer.hitTestObject(beweging)) 
				{
					onGround = true;
				}
				else
				{
					onGround = false;
				}
				
				//speler zit op bewegendplatform
				if (thePlayer.hitTestObject(beweging)) 
				{
					thePlayer.lift = true;
				}
				else
				{
					thePlayer.lift = false;
				}
				
				//bewegend platform naar links en rechts
				if (beweging.hitTestObject(platformlopen)) 
				{
					pushback = true;
				}
				else if(beweging.hitTestObject(platformlopen2))
				{
					pushback = false;
				}
			}
		}
		private function removeChilds():void
		{
			this.removeChildren();
		}
		
	}

}