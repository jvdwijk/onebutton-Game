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
		private var winScreen:GameOverScreenImg = new WinSchermImg;
		
		public function WinScherm() 
		{
			addChild(winScreen);
		}
		
	}

}