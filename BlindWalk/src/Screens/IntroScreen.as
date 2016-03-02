package Screens
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import Screens.Screen;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class IntroScreen extends Screen 
	{
		private var introtext:TextField;
		private var start:TextField;
		
		public static const START_GAME:String = "Start Game!";
		
		public function IntroScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			introtext = new TextField;
			introtext.embedFonts = true;
			introtext.text = "Pong";
			introtext.autoSize = TextFieldAutoSize.CENTER;			
			introtext.setTextFormat(textForm);		
			
			introtext.x = stage.stageWidth / 2 - introtext.textWidth /2;
			introtext.y = stage.stageHeight / 2 - introtext.textHeight /2;
			
			introtext.mouseEnabled = false;
			
			addChild(introtext);
			
			start = new TextField();
			start.embedFonts = true;
			start.text = "press space to start";
			start.autoSize = TextFieldAutoSize.CENTER;
			start.setTextFormat(subForm)
			
			start.x = stage.stageWidth / 2 - start.textWidth / 2;
			start.y = stage.stageHeight / 2 + 20;
			
			start.mouseEnabled = false;
			
			addChild(start);
			
			
			
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
	
