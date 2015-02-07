package  
{
	
	public class DataContainer 
	{
		public var m_RMainMenu: StartButton;
		public var m_Info:Information;
		public var m_InfoBox:InfoBox;
		public var m_Next:Next;
		public var m_Restart:Restart;
		
		public var m_RGS:	GameScreen;
		public var m_RBG:	Background;
		public var m_RFG:	Foreground;
		public var m_RGA:	GameActors;
		
		public var m_Player:Player;
		
		public var m_SpawnX:Number;
		public var m_SpawnY:Number;
		
		public var m_EnemiesOnMap:	Array = new Array(); // Reference to enemy objects
		public var m_BulletsOnMap:	Array = new Array(); // Reference to bullet objects
		
		public var m_Map:	Array = new Array(); // Reference to data
		public var m_Tiles:	Array = new Array(); // Reference to object
		
		public var randomRounded : Number;
		
		public function DataContainer() 
		{	
			SetMap();
			for(var i=0;i<20;i++)
			{
				m_Tiles[i] = new Array();
				for(var j=0;j<15;j++)
				{
					m_Tiles[i][j]=0;
				}
			}
		}
		
		public function SetMap()
		{
			for(var i=0;i<20;i++)
			{
				m_Map[i] = new Array();
				for(var j=0;j<15;j++)
				{
					m_Map[i][j]=0;
					if(i == 0 || j == 0 || i == 19 || j == 14)
					{
						m_Map[i][j]=1;
					}
					else
					{
						if(i == 1 && j == 1 || i == 1 && j == 13 || i == 18 && j == 13 || i == 18 && j == 1)
						{
							m_Map[i][j]=2;
						}
					}
				}
			}
		}
	}
}
