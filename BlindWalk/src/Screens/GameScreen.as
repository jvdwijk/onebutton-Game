package Screens 
{
	import flash.display.MovieClip;
	import Actors.player;
	import Actors.Platform;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class GameScreen extends MovieClip 
	{
		
		private var thePlayer:player = new player;
		private var levelEen:Level1 = new Level1;
		private var hetPlatform:Platform = new Platform;
		public var onGround:Boolean = false;
		
		
		
		
		public function GameScreen() 
		{
			addChild(thePlayer);
			addChild(levelEen);
			//addChild(hetPlatform);
			
			levelEen.x = 400;
			levelEen.y = 405;
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			function loop(e:Event):void
			{
				if (thePlayer.hitTestObject(levelEen)) 
				{
					onGround = true;
				}
				else
				{
					onGround = false;
				}
			}
		}
		
	}

}