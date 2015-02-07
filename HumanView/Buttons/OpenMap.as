package  
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	
	
	public class OpenMap extends VButton 
	{
		public var ToggleMap:Boolean = false;
		private var SnapShot:BitmapData;
		var bm:Bitmap;

		
		public function OpenMap() 
		{
			super();
		}
		
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			if(!ToggleMap)
			{
				SnapShot = new BitmapData(8000, 
										  8000, true, 0x00000000);

				SnapShot.draw(HumanView.SFactory.m_DContainer.m_RBG, new Matrix());
				
				bm = new Bitmap(SnapShot); 
				
				bm.x += 90;
				bm.y += 100;
				bm.width = 900;
				bm.height = 700;
				
				HumanView.SFactory.m_DContainer.m_RFG.addChild(bm);
				ToggleMap = true;
			}	
			else
			{
				HumanView.SFactory.m_DContainer.m_RFG.removeChild(bm);
				ToggleMap = false;
			}
		}
	}
}
