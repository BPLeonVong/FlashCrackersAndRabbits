package Protected
{
	
	import flash.display.MovieClip;
	public class VActor extends MovieClip 
	{
		public function VActor() 
		{
		}
				
		//Processes that are neither dead or alive
		public const _UNINITIALIZED:	String = "UNINITIALIZED"; 	//Created but not running
		public const _REMOVED:		String = "REMOVED"; 		//removed from list but not destroyed
		
		//Living Processes
		public const _RUNNING:		String = "RUNNING"; 		//initialized and running
		public const _PAUSED:			String = "PAUSED"; 			//initialied but stalled
		
		//Dead Processes
		public const _SUCCEEDED:		String = "SUCCEEDED"; 		//completed successfully
		public const _FAILED:			String = "FAILED"; 			//failed to complete
		public const _ABORTED:		String = "ABORTED"; 		//aborted may not have started
		
		public var	_PSTATE:			String;						//State of process
		
		public function VProcess() 
		{
			_PSTATE = _UNINITIALIZED;
			HumanView.ProcessManager.ProcessList.push(this);
		}
		
		public function VOnInit(){_PSTATE = _RUNNING;}
		public function VOnUpdate(deltaMS){};
		public function VOnSuccess(){}
		public function VOnFail(){}
		public function VOnAbort(){}
		
		public function Succeed(){}
		public function Fail(){}
		public function Pause(){}
		public function UnPause(){}
		
		public function GetState():String{return _PSTATE;}
		
		public function IsAlive():Boolean{return (_PSTATE == _RUNNING || _PSTATE == _PAUSED);}
		
		public function IsDead():Boolean{return (_PSTATE == _SUCCEEDED || _PSTATE == _FAILED || _PSTATE == _ABORTED);}
		
		public function IsRemoved():Boolean{return (_PSTATE == _REMOVED);}
		
		public function IsPaused():Boolean{return (_PSTATE == _PAUSED);}
	
		public function SetState(m_PState:String){_PSTATE = m_PState;}
	}
}
