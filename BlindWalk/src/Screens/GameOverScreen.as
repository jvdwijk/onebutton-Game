package Screens 
{
	/**
	 * ...
	 * @author J vd Wijk
	 */
	
	 import flash.display.MovieClip;
	 import flash.text.TextField;
	 import flash.events.Event;
	 import flash.events.KeyboardEvent;
	 import flash.ui.Keyboard;
	 import flash.text.TextFormat;
	 import flash.text.TextFieldAutoSize;
	 
	public class GameOverScreen extends MovieClip
	{
		private var gameOverScreen:GameOverScreenImg = new GameOverScreenImg;
		
		public function GameOverScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
			
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(gameOverScreen);
			gameOverScreen.x = stage.stageWidth / 2;
			gameOverScreen.y = stage.stageHeight / 2;
		}
		
		
	}

}