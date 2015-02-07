package  {
	
	import flash.events.MouseEvent;
	
	
	public class Information extends VButton
	{
		public static var Toggle:Boolean = false;
		
		public function Information() 
		{
			super();
			
		}
		
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			
			if(!Toggle)
			{
				HumanView.SFactory.addObject(HumanView.SFactory.m_DContainer.m_RFG,90,100,0,
											HumanView.SFactory.m_OContainer.m_InfoBox,
											HumanView.SFactory.INFORMATION);
				Toggle = true;
			}
			else
			{
				Toggle = false;
				HumanView.SFactory.m_DContainer.m_RFG.removeChild(HumanView.SFactory.m_DContainer.m_InfoBox);
			}
		}
	}
	
}
