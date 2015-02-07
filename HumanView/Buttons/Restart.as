package  {
	
	import flash.events.MouseEvent;
	
	
	public class Restart extends VButton {
		
		
		public function Restart() {
			super();
			this.visible = false;
		}
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			HumanView.RESTARTGAME();
			this.visible = false;
		}
	}
	
}
