package  {
	import Protected.VActor;
	import flash.utils.Timer;
	import flash.events.*;
	
	public class CollisionChecker extends VActor
	{
		var INTI:Number;
		var INTJ:Number;
		var SpawnTimer:Timer;
		var NotSpawning:Boolean = false;
		
		public function CollisionChecker () 
		{
			VProcess();
		}
		
		override public function VOnUpdate(deltaMS)
		{	
			INTI = 0;
			INTJ = 0;
			for each(var Enemies in HumanView.SFactory.m_DContainer.m_EnemiesOnMap)
			{
				if(HumanView.SFactory.m_DContainer.m_EnemiesOnMap[INTI].GetState() == "SUCCEEDED")
				{
					RemoveItem(INTI,HumanView.SFactory.m_DContainer.m_EnemiesOnMap);
					continue;
				}
				if(HumanView.SFactory.m_DContainer.m_Player.hitTestObject(HumanView.SFactory.m_DContainer.m_EnemiesOnMap[INTI])
					&& !HumanView.SFactory.m_DContainer.m_Player.God)
				{
					HumanView.SFactory.m_DContainer.m_Player.Health--;
					HumanView.SFactory.m_DContainer.m_Player.LoseHealth();
				}
				for each(var Bullet in HumanView.SFactory.m_DContainer.m_BulletsOnMap)
				{
					if(HumanView.SFactory.m_DContainer.m_BulletsOnMap[INTJ].GetState() == "SUCCEEDED")
					{
						RemoveItem(INTJ,HumanView.SFactory.m_DContainer.m_BulletsOnMap);
						continue;
					}
					if(HumanView.SFactory.m_DContainer.m_BulletsOnMap[INTJ].hitTestObject
						(HumanView.SFactory.m_DContainer.m_EnemiesOnMap[INTI]))
					{
						HumanView.SFactory.m_DContainer.m_EnemiesOnMap[INTI].Health--;
						break;
					}
					INTJ++;
				}
				INTI++;
				INTJ = 0;
			}
			INTI = 0;
			INTJ = 0;
			
			if(HumanView.SFactory.m_DContainer.m_EnemiesOnMap.length == 0 && !HumanView.SFactory.m_DContainer.m_Next.visible
				&& HumanView.SFactory.m_DContainer.m_Player.Health>0 && !HumanView.IsSpawning)
			{
				HumanView.SFactory.m_DContainer.m_Next.visible = true;
			}
			
			if(HumanView.IsSpawning && !NotSpawning)
			{
				SpawnTimer = new Timer(1000,10);
				SpawnTimer.addEventListener(TimerEvent.TIMER, MonsterTimer);
				SpawnTimer.addEventListener(TimerEvent.TIMER_COMPLETE, MonsterComplete);
				SpawnTimer.start();
				NotSpawning = true;
			}
		}
				
		function MonsterTimer (e:TimerEvent):void
		{
			if(HumanView.SFactory.m_DContainer.m_Player.Health>0)
			{
			HumanView.SetSpawnLocation();
			HumanView.SFactory.addAI(HumanView.SFactory.m_DContainer.m_RGA,HumanView.SFactory.m_DContainer.m_SpawnX,
									 HumanView.SFactory.m_DContainer.m_SpawnY,HumanView.MonsterHPBonus,0,
									 HumanView.SFactory.m_OContainer.m_EnemyI,HumanView.SFactory.ENEMEYI);
			}
			else
			{
				SpawnTimer.stop();
				HumanView.IsSpawning = false;
				NotSpawning = false;
				SpawnTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, MonsterTimer);
				SpawnTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, MonsterComplete);
			}
		}
		
		function MonsterComplete (e:TimerEvent):void
		{
			SpawnTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, MonsterTimer);
			SpawnTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, MonsterComplete);
			HumanView.IsSpawning = false;
			NotSpawning = false;
		}
		
		function RemoveItem(myindex,array) 
		{
			array.splice(myindex, 1);
		}
	}
}
