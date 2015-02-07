package  
{
	import Protected.VActor;
	
	public class EnemyI extends VUnit 
	{
		private var xPos:Number;
		private var yPos:Number;
		private var xDes:Number;
		private var yDes:Number;
		private var angle:Number;
		private var speed:Number;
		private var xSpeed:Number;
		private var ySpeed:Number;
		
		public var Health :Number;
				
		
		public function EnemyI(hp) 
		{
			super();
			VProcess();
			Health = hp;
			trace(hp);
		}
		
		
		public function Seek()
		{
			xPos = this.x;
			yPos = this.y;
			xDes  = HumanView.SFactory.m_DContainer.m_Player.x;
			yDes  = HumanView.SFactory.m_DContainer.m_Player.y;
			angle = (Math.atan2(yDes-yPos,xDes-xPos))*(180/Math.PI);
			speed = 5;
			setVelocity();
		}
		
		override public function VOnUpdate(deltaMS)
		{	
			Seek();
			if(xSpeed && ySpeed)
			{
				this.x += xSpeed * speed;
				this.y += ySpeed * speed;
				if(xSpeed > 0)
				{
					this.gotoAndStop("MoveRight");
				}
				else
				{
					this.gotoAndStop("MoveLeft");
				}
			}
			if(Health <= 0)
			{
				SetState("SUCCEEDED");
			}
		}
		
		override public function VOnSuccess()
		{
			if(xSpeed > 0)
			{
				this.gotoAndStop("RRight");
			}
			else
			{
				this.gotoAndStop("RLeft");
			}
		}
		
		private function setVelocity():void 
		{
        	xSpeed = Math.cos( angle * ( Math.PI / 180 ) );
        	ySpeed = Math.sin( angle * ( Math.PI / 180 ) );
		}
	}
}
