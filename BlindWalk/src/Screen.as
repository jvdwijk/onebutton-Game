package src
{
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Screen
	{
	protected var textForm:TextFormat;
	protected var subForm:TextFormat;
	protected var scoreForm:TextFormat;
	
		public function Screen() 
		{
			textFormat = new TextFormat();
			textFormat.size = 60;
			textFormat.color = 0xffffff;
			
			
			subFormat = new TextFormat();
			subFormat.size = 20;
			subFormat.color = 0xff0000;
			
			scoreFormat = new TextFormat();
			scoreFormat.size = 40;
			scoreFormat.color = 0xffffff;
		}
		
	}
	
}