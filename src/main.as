package  {
	
	public class main {

		public function main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point			
			soundPlayer = new SoundPlayer(this);
			buildIntroSreen();
		}
		
		private function buildIntroSreen():void
		{		
			
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.INTRO_SCREEN, intro);
		}

	}
	
}
