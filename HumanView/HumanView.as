package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import flash.system.System;
	
	public class HumanView extends MovieClip 
	{
		public static var 	ProcessManager:	VProcessManager;
		public static var 	Input:			InputDeviceManager;
		public static var	SFactory:		SpriteFactory;
		public static var	Collision:		CollisionChecker;
		public static var	IsSpawning:		Boolean;
		public static var	MonsterHPBonus: Number;
		
		
		public function initializeGame() 
		{
			ProcessManager 	= new VProcessManager();
			Input 			= new InputDeviceManager();
			SFactory		= new SpriteFactory();
			SFactory.addObject(this,0,0,0,SFactory.m_OContainer.m_GS,SFactory.GS);
			SFactory.addObject(SFactory.m_DContainer.m_RGS,0,0,0,SFactory.m_OContainer.m_BG,SFactory.BG);
			SFactory.addObject(SFactory.m_DContainer.m_RGS,0,0,0,SFactory.m_OContainer.m_GA,SFactory.GA);
			SFactory.addObject(this,0,0,0,SFactory.m_OContainer.m_FG,SFactory.FG);
			
			SFactory.addObject(SFactory.m_DContainer.m_RFG,0,0,0,SFactory.m_OContainer.m_MainMenu,SFactory.START);
		
			stage.addEventListener(Event.ENTER_FRAME,VUpdate);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyboardEventCheckDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,KeyboardEventCheckUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, MouseEventDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, MouseEventUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,MousePosition);
		}
		
		public static function GAMESTART()
		{	
			//Remove Screen
			SFactory.m_DContainer.m_RFG.removeChild(SFactory.m_DContainer.m_RMainMenu);
			
			//Render Background
			SFactory.RenderBackground(SFactory.m_DContainer.m_RBG);
			
			//Generate UI
			SFactory.addObject(SFactory.m_DContainer.m_RFG,600,0,0,SFactory.m_OContainer.m_Next,SFactory.NEXT);
			SFactory.addObject(SFactory.m_DContainer.m_RFG,600,0,0,SFactory.m_OContainer.m_Restart,SFactory.RESTART);
		
			//Generate Game
			SFactory.addObject(SFactory.m_DContainer.m_RGS,400,300,0,SFactory.m_OContainer.m_Player,SFactory.PLAYER);
			
			Collision		= new CollisionChecker();
			
			
		}

		public static function SetSpawnLocation()
		{
			SFactory.m_DContainer.randomRounded = Math.ceil((Math.random() * 20));
			if(SFactory.m_DContainer.randomRounded<6)
			{
				SFactory.m_DContainer.m_SpawnX = 60;
				SFactory.m_DContainer.m_SpawnY = 60;
			}
			else if(SFactory.m_DContainer.randomRounded<11)
			{
				SFactory.m_DContainer.m_SpawnX = 60;
				SFactory.m_DContainer.m_SpawnY = 540;
			}
			else if(SFactory.m_DContainer.randomRounded<16)
			{
				SFactory.m_DContainer.m_SpawnX = 740;
				SFactory.m_DContainer.m_SpawnY = 540;
			}
			else if(SFactory.m_DContainer.randomRounded<21)
			{
				SFactory.m_DContainer.m_SpawnX = 740;
				SFactory.m_DContainer.m_SpawnY = 60;
			}
		}
		
		public static function SpawnMonster(hpBonus)
		{
			MonsterHPBonus = hpBonus;
			IsSpawning = true;
			SFactory.m_DContainer.m_RFG.RHealth.text = MonsterHPBonus.toString();
		}
		
		public static function RESTARTGAME()
		{
			HumanView.SFactory.m_DContainer.m_Player.Health = 10;
			HumanView.SFactory.m_DContainer.m_Player.Revive();
			for(var i = SFactory.m_DContainer.m_RGA.numChildren - 1; i > -1 ; i--)
			{
				SFactory.m_DContainer.m_RGA.removeChildAt( i );
			}
			System.gc();
		}
		
		private function KeyboardEventCheckDown(e:KeyboardEvent){Input.KeyboardEventCheckDown(e);}
		
		private function KeyboardEventCheckUp(e:KeyboardEvent){Input.KeyboardEventCheckUp(e);}
		
		private function MouseEventDown(e:MouseEvent){Input.MouseEventDown(e);}
		
		private function MouseEventUp(e:MouseEvent){Input.MouseEventUp(e);}
		
		private function MousePosition(e:MouseEvent):void{Input.MouseHover(e);}//Sets position of Mouse when Move
		
		public function VUpdate(e:Event)
		{
			ProcessManager.UpdateProcesses(0);
		}
				
		
		public function exitApplication()
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,MousePosition);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,KeyboardEventCheckDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP,KeyboardEventCheckUp);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, MouseEventDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, MouseEventUp);
			stage.removeEventListener(Event.ENTER_FRAME,VUpdate);
			StartUpModule.ShutDown();
		}
	}
}