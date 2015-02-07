package  
{
	/* to do: 
	hit tests
	drawing
*/
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.system.System;
	import flash.utils.Timer;
	
	public class StartUpModule extends MovieClip 
	{
		private var gameView:	HumanView	= new HumanView();
		
		private function debugOn():void
		{
			var debug:Timer = new Timer(1000,0);
			debug.addEventListener(TimerEvent.TIMER, debugtime,false,0,true);
			debug.start();
		}
		
		private function debugtime(e:TimerEvent){
			trace("Memory Used: " + System.totalMemory / 1024 / 1024 + " Mb");
		}
		
		
		public function StartUpModule() 
		{
			//debugOn();
			StartUp();
			RunGameLoop(); 
			
		}

		public function RunGameLoop()
		{
			addChild(gameView);
			MovieClip(gameView).initializeGame();
		}
		
		public static function StartUp()
		{
		}
		
		public static function ShutDown()
		{
			System.exit(0);
		}
	}	
}