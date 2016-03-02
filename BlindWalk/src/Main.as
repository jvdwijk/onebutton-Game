package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import Screens.IntroScreen;
	import Screens.GameScreen;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Main extends Sprite 
	{
		private var introScreen:IntroScreen;
		private var gameScreen:GameScreen;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.START_GAME, startGame);
		}
		
		private function startGame(e:Event):void
		{
			removeChild(introScreen);
			gameScreen = new GameScreen();
			addChild(gameScreen);
			//gameScreen.addEventListener(GameScreen.START_GAME, startGame);
						
		}
		
		private function Spatie(E:KeyboardEvent):void 
		{
			if (E.keyCode == 32) 
			{
				
			}
		}
	}
	
}