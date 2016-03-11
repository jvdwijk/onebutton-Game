package Actors
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import Screens.GameScreen;
	import Screens.TweedeLevel;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class player extends MovieClip
	{
		private var speler:blindeSpeler = new blindeSpeler;
		private var speed:int = 3;
		public var gravity:int = 0;
		
		
		public static const NEXT_LEVEL:String = "Next Level!";
		public static const GAME_OVER:String = "Game Over!";
		
		public function player()
		{
			addChild(speler);
			speler.scaleX = 0.08;
			speler.scaleY = 0.08;
			this.x = 30;
			this.y = 370;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, loop);
			
			function init():void
			{
				stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			
			}
			
			function onKeyDown(E:KeyboardEvent):void
			{
				if (E.keyCode == Keyboard.SPACE)
				{
					speed = 0;
				}
			}
			
			function onKeyUp(E:KeyboardEvent):void
			{
				if (E.keyCode == Keyboard.SPACE)
				{
					speed = 20;
				}
			}
			
			function loop(e:Event):void
			{
				var parentvar:MovieClip = parent as MovieClip;
				
				
				speler.x += speed;
				speler.y += gravity;
				
				if (parentvar != null)
				{
					if (parentvar is GameScreen)
					{
						var gameScreen:GameScreen = parentvar as GameScreen;
						
						if (speler.x >= 789)
						{
							removeEventListener(Event.ENTER_FRAME, loop);
							dispatchEvent(new Event(NEXT_LEVEL, true));
						}
						
						if (gameScreen.onGround == false)
						{
							gravity = 3;
						}
						else
						{
							gravity = 0;
						}
					}
					if (parentvar is TweedeLevel)
					{
						var tweedeLevel:TweedeLevel = parentvar as TweedeLevel;
						if (tweedeLevel.onGround == false)
						{
							gravity = 3;
						}
						else
						{
							gravity = 0;
						}
					}
				}
				
				
				
				if (speler.y >= 130)
				{
					removeEventListener(Event.ENTER_FRAME, loop);
					dispatchEvent(new Event(GAME_OVER, true));
				}
			}
		}
	}
}