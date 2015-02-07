package  
{
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.*;
	
	
	public class Player extends VUnit 
	{
		
		private var speed:Number = 10;
		private var radians:Number;
		private var degrees:Number;
		private var BulletDirect:Number;
		public var CanShoot:Number = 0;
		public var Health:Number = 10;
		public var God:Boolean = false;
		var LifeSpan:Timer;
		
		public function Player() 
		{
			VProcess();
			HumanView.SFactory.m_DContainer.m_RFG.MyHealth.text = Health.toString();
		}
		
		override public function VOnUpdate(deltaMS)
		{
			if(InputDeviceManager.KA && this.x>41)
			{
				this.x -= speed;
			}
			else if(InputDeviceManager.KD && this.x<760)
			{
				this.x += speed;
			}
			if(InputDeviceManager.KW && this.y>41)
			{
				this.y -= speed;
			}
			else if(InputDeviceManager.KS && this.y<560)
			{
				this.y += speed;
			}

			CanShoot++;
			
			if(InputDeviceManager.MDOWN && CanShoot > 10)
			{
				BulletDirect = (Math.atan2(InputDeviceManager.YMOUSE-300,InputDeviceManager.XMOUSE-400))*(180/Math.PI);
				HumanView.SFactory.addProjectile(HumanView.SFactory.m_DContainer.m_RGA,this.x,this.y,BulletDirect,
				0,HumanView.SFactory.m_OContainer.m_Projectile,HumanView.SFactory.PROJECTILE);
				CanShoot = 0;
			}
			
			radians = Math.atan2(InputDeviceManager.YMOUSE-this.y, InputDeviceManager.XMOUSE-this.x);
			degrees = (radians/Math.PI)*180;
			this.rotation = degrees;
			
			if(Health<=0)
			{
				SetState("SUCCEEDED");
				var i:Number = 0
				for each(var ETarget in HumanView.SFactory.m_DContainer.m_EnemiesOnMap)
				{
					HumanView.SFactory.m_DContainer.m_EnemiesOnMap[i].SetState("SUCCEEDED");
					i++;
				}
				HumanView.SFactory.m_DContainer.m_Restart.visible = true;
			}
		}
		
		public function Revive()
		{
			this._PSTATE = _UNINITIALIZED;
			HumanView.ProcessManager.ProcessList.push(this);
			HumanView.SFactory.m_DContainer.m_RFG.MyHealth.text = Health.toString();
		}
		
		public function LoseHealth()
		{
			God = true;
			LifeSpan = new Timer(1000,3);
			LifeSpan.addEventListener(TimerEvent.TIMER_COMPLETE, LifeComplete);
			LifeSpan.start();
			this.alpha = 0.5;
			speed*=2;
			HumanView.SFactory.m_DContainer.m_RFG.MyHealth.text = Health.toString();
		}
		
		function LifeComplete (e:TimerEvent):void
		{
			LifeSpan.removeEventListener(TimerEvent.TIMER_COMPLETE, LifeComplete);
			God = false;
			this.alpha = 1;
			speed/=2;
		}
		
		private function roundToNearest(roundTo:Number, value:Number):Number
		{
			if(Math.round(value/roundTo)*roundTo>value)
			{
				return Math.round(value/roundTo)*roundTo - 160;
			} else
			{
				return Math.round(value/roundTo)*roundTo;
			}
		}
		
	}
}
