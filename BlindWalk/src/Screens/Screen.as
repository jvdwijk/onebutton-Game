package Screens
{
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author J vd Wijk
	 */
	public class Screen extends MovieClip
	{
	protected var textForm:TextFormat;
	protected var subForm:TextFormat;
	protected var scoreForm:TextFormat;
	
		public function Screen() 
		{
			textForm = new TextFormat();
			textForm.size = 60;
			textForm.color = 0xffffff;
			
			
			subForm = new TextFormat();
			subForm.size = 20;
			subForm.color = 0xff0000;
			
			scoreForm = new TextFormat();
			scoreForm.size = 40;
			scoreForm.color = 0xffffff;
		}
		
	}
	
}