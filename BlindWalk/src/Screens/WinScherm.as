package Screens 
{
	import flash.display.MovieClip;
	 import flash.text.TextField;
	 import flash.events.Event;
	 import flash.events.KeyboardEvent;
	 import flash.ui.Keyboard;
	 import flash.text.TextFormat;
	 import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class WinScherm extends MovieClip
	{
		private var winScreen:WinSchermImg = new WinSchermImg;
		
		public static const START_AGAIN:String = "Start over again after Winning";
		
		public function WinScherm() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(winScreen);
			
			winScreen.x = stage.stageWidth / 2;
			winScreen.y = stage.stageHeight / 2;
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				dispatchEvent(new Event(START_AGAIN));
				
			}
		}
		
	}

}