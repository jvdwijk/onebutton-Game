package Screens
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class IntroScreen extends MovieClip 
	{
		
		private var startImg:MovieClip = new IntroSchermImg();
		
		public static const START_GAME:String = "Start Game!";
		
		public function IntroScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(startImg);
			startImg.x = stage.stageWidth / 2;
			startImg.y = stage.stageHeight / 2;
			
			
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				dispatchEvent(new Event(START_GAME));
				
			}
		}
	}
}