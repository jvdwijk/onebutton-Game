package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(KeyboardEvent.KEY_DOWN, Spatie);
		}
		
		private function Spatie(E:KeyboardEvent):void 
		{
			if (keyCode == 32) 
			{
				
			}
		}
	}
	
}