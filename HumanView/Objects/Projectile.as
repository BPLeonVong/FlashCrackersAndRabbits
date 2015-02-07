package  
{
	import Protected.VActor;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.*;
	
	
	public class Projectile extends VActor 
	{
		
		private var xPos:Number;
		private var yPos:Number;
		private var xDes:Number;
		private var yDes:Number;
		private var angle:Number;
		private var speed:Number;
		private var xSpeed:Number;
		private var ySpeed:Number;
		var LifeSpan:Timer = new Timer(1000,2);
		public function Projectile(xPos,yPos,aRotation) 
		{
			VProcess();
			
			this.x = xPos;
			this.y = yPos;
			this.rotation = angle = aRotation;
			
			setVelocity();
			LifeSpan.addEventListener(TimerEvent.TIMER_COMPLETE, LifeComplete);
			LifeSpan.start();
			//Set bullet direction
			//attach lifespan
		}
		
		override public function VOnUpdate(deltaMS)
		{	
			if(xSpeed && ySpeed)
			{
				this.x += xSpeed * speed;
				this.y += ySpeed * speed;	
			}
		}
		
		function LifeComplete (e:TimerEvent):void
		{
			LifeSpan.removeEventListener(TimerEvent.TIMER_COMPLETE, LifeComplete);
			parent.removeChild(this);
		}
		
		private function setVelocity():void 
		{
			xPos = this.x;
			yPos = this.y;
			xDes  = InputDeviceManager.XMOUSE;
			yDes  = InputDeviceManager.YMOUSE;
			angle = (Math.atan2(yDes-yPos,xDes-xPos))*(180/Math.PI);
			//this.rotation = angle;
			speed = 20;
			
        	xSpeed = Math.cos( angle * ( Math.PI / 180 ) );
        	ySpeed = Math.sin( angle * ( Math.PI / 180 ) );
		}
	}
}
