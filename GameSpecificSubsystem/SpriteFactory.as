package  
{
	
	public class SpriteFactory 
	{
		public var m_OContainer:		ObjectContainer;
		public var m_DContainer:		DataContainer;
		
		public var TILE 	  	:String = "Tile";
		public var GS 	  		:String = "GS";
		public var BG 	  		:String = "BG";
		public var FG 	  		:String = "FG";
		public var GA 	  		:String = "GA";
		public var PLAYER		:String = "PLAYER";
		public var RESTART		:String = "RESTART";
		public var START		:String = "START";
		public var OPENMAP		:String = "OPENMAP";
		public var INFORMATION	:String = "INFO";
		public var ENEMEYI		:String = "EnemyI";
		public var PROJECTILE	:String = "PROJECTILE";
		public var NEXT			:String = "NEXT";


		public function SpriteFactory() 
		{
			m_OContainer = new ObjectContainer();
			m_DContainer = new DataContainer();
		}
		
		public function RenderBackground(bg)
		{
			for(var i=0;i<20;i++)
			{
				for(var j=0;j<15;j++)
				{
					if(m_DContainer.m_Map[i][j]==0)
					{
						addTiles(bg,0+40*i,0+40*j,1,m_OContainer.m_tiles,TILE,i,j);
					}
					else if(m_DContainer.m_Map[i][j]==1)
					{
						addTiles(bg,0+40*i,0+40*j,2,m_OContainer.m_tiles,TILE,i,j);
					}
					else if(m_DContainer.m_Map[i][j]==2)
					{
						addTiles(bg,0+40*i,0+40*j,3,m_OContainer.m_tiles,TILE,i,j);
					}
				}
			}
		}
		
		public function addTiles(Parent,xPos, yPos, frame, object, objectName:String,arrayx,arrayy)
		{
			object = new Tile();
			object.x = xPos;
			object.y = yPos;
			object.gotoAndStop(frame);
			Parent.addChild(object);
			m_DContainer.m_Tiles[arrayx][arrayy] = object;
		}
		
		public function addProjectile(Parent,xPos, yPos, angle, frame, object, objectName:String)
		{
			object = new Projectile(xPos,yPos,angle);
			addObject(Parent,xPos,yPos,frame,object,objectName);
		}
		
		public function addAI(Parent,xPos, yPos, hp, frame, object, objectName:String)
		{
			object = new EnemyI(hp);
			addObject(Parent,xPos,yPos,frame,object,objectName);
		}
		
		public function addObject(Parent,xPos, yPos, frame, object, objectName:String)
		{
			switch (objectName)
			{
				case GS:
					object = new GameScreen();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RGS = object;
					break;
				case BG:
					object = new Background();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RBG = object;
					break;
				case FG:
					object = new Foreground();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RFG = object;
					break;
				case GA:
					object = new GameActors();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RGA = object;
					break;
				case RESTART:
					object = new Restart();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_Restart = object;
					break;
				case START:
					object = new StartButton();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_RMainMenu = object;
					break;
				case INFORMATION:
					object = new InfoBox();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_InfoBox = object;
					break;
				case NEXT:
					object = new Next();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_Next = object;
					break;
				case PLAYER:
					object = new Player();
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_Player = object;
					break;
				case ENEMEYI:
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_EnemiesOnMap.push(object);
					break;
				case PROJECTILE:
					object.x = xPos;
					object.y = yPos;
					object.gotoAndStop(frame);
					Parent.addChild(object);
					m_DContainer.m_BulletsOnMap.push(object);
					break;
			}
		}
	}
}
