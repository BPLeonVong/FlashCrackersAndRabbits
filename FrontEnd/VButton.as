package  
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class VButton extends MovieClip 
	{
		public function VButton()
		{
			this.addEventListener(MouseEvent.CLICK,MouseClickFunction);
		}
		
		protected function MouseClickFunction(e:MouseEvent) :void{}
	}
}