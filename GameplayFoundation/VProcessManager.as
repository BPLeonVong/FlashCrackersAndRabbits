package  
{
	import flash.system.System;
	
	public class VProcessManager 
	{
		public var ProcessList:Array = new Array;
		
		public function VProcessManager() {}
		
		public function UpdateProcesses(deltaMS)
		{
			var i:int = 0;
			
			for each (var Processes in ProcessList)
			{
				if(ProcessList[i].GetState() == "UNINITIALIZED")
				{
					ProcessList[i].VOnInit();
				}
				if(ProcessList[i].GetState() == "RUNNING")
				{
					ProcessList[i].VOnUpdate(deltaMS);
				}
				if(ProcessList[i].IsDead())
				{
					switch(ProcessList[i].GetState())
					{
						case "SUCCEEDED":
							ProcessList[i].VOnSuccess();
							break;
						case "FAILED":
							ProcessList[i].VOnFail();
							break;
						case "ABORTED":
							ProcessList[i].VOnAbort();
							break;
					}
					ProcessList.splice(i,1);
				}
				i++;
			
			}
		}
		
		public function AbortAllProcesses(immediate:Boolean):void
		{
			var i:int = 0;
			for each (var Processes in ProcessList)
			{
				ProcessList[i].SetState("ABORTED");
			}
		}
		
		public function GetProcessCount(){return ProcessList.length();}
		
		public function ClearAllProcesses()
		{
			ProcessList = [];
		}
	}
}
