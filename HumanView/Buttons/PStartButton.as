package  {
	
	import flash.events.MouseEvent;
	
	public class PStartButton extends VButton {
		
		
		public function PStartButton() {
			super();
		}
		
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			HumanView.GAMESTART();
		}
	}
	
}
