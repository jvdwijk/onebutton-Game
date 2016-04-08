package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import Screens.GameOverScreen;
	import Screens.IntroScreen;
	import Screens.GameScreen;
	import Screens.WinScherm;
	import Actors.player;
	import flash.display.MovieClip;
	import Screens.TweedeLevel;
	import Screens.DerdeLevel;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Main extends Sprite 
	{
		private var introScreen:IntroScreen;
		private var gameScreen:GameScreen;
		private var leveltwee:TweedeLevel;
		private var levelDrie:DerdeLevel;
		private var gameOver:GameOverScreen;
		private var wonGame:WinScherm;
		private var playerclass:player = new player();
			public var checkpoint:String = "level 1";
		
		
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			
			if (gameOver != null) {
				removeChild(gameOver);
			}
			if (wonGame != null) {
				removeChild(wonGame);
			}
			removeEventListener(Event.ADDED_TO_STAGE, init);
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.START_GAME, startGame);
		}
		
		private function startGame(e:Event):void
		{
			removeChild(introScreen);
			if (checkpoint == "level 1")
			{
			gameScreen = new GameScreen();
			addChild(gameScreen);
			gameScreen.addEventListener(player.NEXT_LEVEL, goToLevel1);
			}
			else if(checkpoint == "level 2")
			{
				leveltwee = new TweedeLevel();
			addChild(leveltwee);
			leveltwee.addEventListener(player.GAME_OVER, getGameOverScreen);
			leveltwee.addEventListener(player.LEVEL_DRIE, hetDerdeLevel);
			}
			else if (checkpoint == "level 3")
			{
				levelDrie = new DerdeLevel();
				addChild(levelDrie);
				levelDrie.addEventListener(player.GAME_OVER, getGameOverScreen);
				levelDrie.addEventListener(player.END_GAME, endTheGame);
			}
		}
		
		private function goToLevel1(e:Event = null):void 
		{
			removeChild(gameScreen);
			leveltwee = new TweedeLevel();
			addChild(leveltwee);
			leveltwee.addEventListener(player.GAME_OVER, getGameOverScreen);
			leveltwee.addEventListener(player.LEVEL_DRIE, hetDerdeLevel);
		}
		
		private function hetDerdeLevel(e:Event):void
		{
			removeChild(leveltwee);
			levelDrie = new DerdeLevel();
			addChild(levelDrie);
			levelDrie.addEventListener(player.GAME_OVER, getGameOverScreen);
			levelDrie.addEventListener(player.END_GAME, endTheGame);
		}
		
		private function endTheGame(e:Event):void
		{
			removeChild(levelDrie);
			wonGame = new WinScherm();
			addChild(wonGame);
			wonGame.addEventListener(WinScherm.START_AGAIN, init)
		}
		
		private function getGameOverScreen(e:Event):void
		{
			if (playerclass.level == "level2")
			{
			removeChild(leveltwee);
			}
			else if (playerclass.level == "level3")
			{
				removeChild(levelDrie);
			}
			gameOver = new GameOverScreen();
			addChild(gameOver);
			gameOver.addEventListener(GameOverScreen.START_OVER, init)
		}
	}
	
}