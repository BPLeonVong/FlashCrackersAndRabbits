package  {
	
	import flash.events.MouseEvent;
	
	
	public class InfoBox extends VButton 
	{
		
		
		public function InfoBox() 
		{
			super();
		}
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			Information.Toggle = false;
			parent.removeChild(this);
		}
	}
}
