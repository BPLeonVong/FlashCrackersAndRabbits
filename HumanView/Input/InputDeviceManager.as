package  
{
	
	import flash.events.*;
	import flash.ui.*;
	
	public class InputDeviceManager 
	{
		public static var KW:Boolean 	= false;
		public static var KA:Boolean 	= false;
		public static var KS:Boolean 	= false;
		public static var KD:Boolean 	= false;
		
		public static var KLEFT:Boolean 	= false;
		public static var KDOWN:Boolean 	= false;
		public static var KRIGHT:Boolean 	= false;
		public static var KUP:Boolean 		= false;
		
		public static var MDOWN:Boolean		= false;
		
		public static var XMOUSE:Number;
		public static var YMOUSE:Number;
				
		
		public function InputDeviceManager() {}
		public function KeyboardEventCheckDown(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case Keyboard.W:
					KW = true;
					break;
				case Keyboard.A:
					KA = true;
					break;
				case Keyboard.S:
					KS = true;
					break;
				case Keyboard.D:
					KD = true;
					break;
				case Keyboard.LEFT:
					KLEFT = true;
					break;
				case Keyboard.DOWN:
					KDOWN = true;
					break;
				case Keyboard.RIGHT:
					KRIGHT = true;
					break;
				case Keyboard.UP:
					KUP = true;
					break;
			}
		}
		
		public function KeyboardEventCheckUp(e:KeyboardEvent)
		{
			switch(e.keyCode)
			{
				case Keyboard.W:
					KW = false;
					break;
				case Keyboard.A:
					KA = false;
					break;
				case Keyboard.S:
					KS = false;
					break;
				case Keyboard.D:
					KD = false;
					break;
				case Keyboard.LEFT:
					KLEFT = false;
					break;
				case Keyboard.DOWN:
					KDOWN = false;
					break;
				case Keyboard.RIGHT:
					KRIGHT = false;
					break;
				case Keyboard.UP:
					KUP = false;
					break;
			}
		}
		
		public function MouseEventDown(e:MouseEvent)
		{
			MDOWN = true;
		}
		
		public function MouseEventUp(e:MouseEvent)
		{
			MDOWN = false;
		}
		
		public function MouseHover(e:MouseEvent)
		{
			XMOUSE =  e.stageX;
			YMOUSE =  e.stageY;
		}
	}
}
