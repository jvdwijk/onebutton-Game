package Actors 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class BewegendPlatform extends MovieClip
	{
		private var bewegendplatformpje:bewegendPlatformImg = new bewegendPlatformImg;
		public function BewegendPlatform() 
		{
			addChild(bewegendplatformpje);
			bewegendplatformpje.y = 450; 
		}
		
	}

}