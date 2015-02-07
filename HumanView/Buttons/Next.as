package  {
	
	import flash.events.MouseEvent;
	
	
	public class Next extends VButton {
		
		private var ToggleNextPrompt:Boolean;
		private var hpBonus = 1;
		
		public function Next() {
			super();
			ToggleNextPrompt = true;
		}
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			if(HumanView.SFactory.m_DContainer.m_EnemiesOnMap.length == 0)
			{
				hpBonus++;
				HumanView.SpawnMonster(hpBonus);
				this.visible = false;
			}
		}
	}
}
