package Screens 
{
	import Actors.Block;
	import Actors.Platform;
	import flash.display.MovieClip;
	import Actors.player;
	import flash.events.Event;
	import Actors.BewegendPlatform;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class DerdeLevel extends MovieClip
	{
		private var thePlayer:player = new player(30,370);
		private var levelDrie:Level3 = new Level3;
		private var platformlopen:Platform = new Platform;
		private var crushingBlock:Block = new Block(200);
		private var crushingBlock2:Block = new Block(400);
		private var crushingBlock3:Block = new Block(600);
		public var onGround:Boolean = false;
		
		public function DerdeLevel() 
		{
			addChild(thePlayer);
			addChild(levelDrie);
			addChild(crushingBlock);
			addChild(crushingBlock2);
			addChild(crushingBlock3);
			
			levelDrie.x = 400;
			levelDrie.y = 405;
			
			crushingBlock.speedGrade = "slow";
			crushingBlock2.speedGrade = "normal";
			crushingBlock3.speedGrade = "fast";
			
			platformlopen.x = 300;
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			function loop(e:Event):void
			{
				if (thePlayer.x >= 788)
				{
					this.removeChildren();
				}
				if (thePlayer.dead == true)
				{
					removeChilds();
				}
				
				if (thePlayer.hitTestObject(crushingBlock) || thePlayer.hitTestObject(crushingBlock2) || thePlayer.hitTestObject(crushingBlock3) ) 
				{
					thePlayer.crushed = true;
				}
				else
				{
					thePlayer.crushed = false;
				}
			}
		}
		
		private function removeChilds():void
		{
			thePlayer.dead == false;
			this.removeChildren();
		}
	}

}