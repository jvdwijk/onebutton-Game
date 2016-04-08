package Actors
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import Screens.GameScreen;
	import Screens.TweedeLevel;
	import Screens.DerdeLevel;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundMixer;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class player extends MovieClip
	{
		private var speler:blindeSpeler = new blindeSpeler;
		private var speed:int = 3;
		public var gravity:int = 0;
		public var level:String = "level1";	
		public var dead:Boolean = false;
		public var crushed:Boolean = false;
		public var lift:Boolean = false;
		private var liftSnelheid:int = 0;
		private var main:Main = new Main;
		private var backgroundSound:Sound = new Sound(new URLRequest("https://www.freesound.org/data/previews/245/245587_1897685-lq.mp3"));
		
		public static const NEXT_LEVEL:String = "Next Level!";
		public static const GAME_OVER:String = "Game Over!";
		public static const LEVEL_DRIE:String = "Next Level!";
		public static const END_GAME:String = "End of Game!";
		
		public function player(xpos:Number = 0, ypos:Number = 0)
		{
			addChild(speler);
			speler.scaleX = 0.08;
			speler.scaleY = 0.08;
			this.x = xpos;
			this.y = ypos;
			
			
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		function init(e:Event):void
			{
				backgroundSound.play();
				
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
					speed = 3;
				}
			}
			
			function loop(e:Event):void
			{
				
				var parentvar:MovieClip = parent as MovieClip;
				
				
				speler.x += speed + liftSnelheid;
				speler.y += gravity;
				
				if (parentvar != null)
				{
					if (parentvar is GameScreen)
					{
						var gameScreen:GameScreen = parentvar as GameScreen;
						
						level = "level1";
						main.checkpoint = "level 1";
						
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
						
						level = "level2";
						main.checkpoint = "level 2";
						if (speler.x >= 789)
						{
							removeEventListener(Event.ENTER_FRAME, loop);
							dispatchEvent(new Event(LEVEL_DRIE, true));
						}
						
						if (tweedeLevel.onGround == false)
						{
							gravity = 3;
						}
						else
						{
							gravity = 0;
						}
						
						if (lift == true)
						{
							liftSnelheid = 2;
						}
						else 
						{
							liftSnelheid = 0;
						}
						
					}
					if (parentvar is DerdeLevel)
					{
						var derdeLevel:DerdeLevel = parentvar as DerdeLevel;
						main.checkpoint = "level 3";
						level = "level3";
						gravity = 0;
						
						if (speler.x >= 789)
						{
							removeEventListener(Event.ENTER_FRAME, loop);
							dispatchEvent(new Event(END_GAME, true));
						}
					}
				}
				
				
				
				if (speler.y >= 140 || crushed == true )
				{
					removeEventListener(Event.ENTER_FRAME, loop);
					dead = true;
					crushed = false;
					dispatchEvent(new Event(GAME_OVER, true));
				}
			}
		}
	}
