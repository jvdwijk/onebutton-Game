package src
{
	import flash.text.TextField;

	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class IntroScreen extends Screen 
	{
		private var introtext:TextField;
		private var start:TextField;
		
		
		public function IntroScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init() 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			introtext = new TextField;
			introtext.embedFonts = true;
			introtext.text = "Pong";
			introtext.autoSize = TextFieldAutoSize.CENTER;			
			introtext.setTextFormat(textFormat);		
			
			introtext.x = stage.stageWidth / 2 - title.textWidth /2;
			introtext.y = stage.stageHeight / 2 - title.textHeight /2;
			
			introtext.mouseEnabled = false;
			
			addChild(introtext);
			
			start = new TextField();
			start.embedFonts = true;
			start.text = "press space to start";
			start.autoSize = TextFieldAutoSize.CENTER;
			start.setTextFormat(subFormat)
			
			start.x = stage.stageWidth / 2 - start.textWidth / 2;
			start.y = stage.stageHeight / 2 + 20;
			
			start.mouseEnabled = false;
			
			addChild(start);
			
			start.addEventListener(Event.ENTER_FRAME, loop);
			
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE) 
			{
				start.removeEventListener(Event.ENTER_FRAME, loop);		
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				dispatchEvent(new Event(CHOOSE_GAME));
				
			}
		}
	}
}
	
