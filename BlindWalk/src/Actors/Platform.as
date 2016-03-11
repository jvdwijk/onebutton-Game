package Actors 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Platform extends MovieClip
	{
		private var loopPlatform:platformImg = new platformImg;
		
		public function Platform() 
		{
			addChild(loopPlatform);
			loopPlatform.x = 0;
			loopPlatform.y = 450;
		}
		
	}

}