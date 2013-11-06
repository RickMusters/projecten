package Src  
{
		import flash.display.MovieClip;
		import flash.events.MouseEvent;
		import flash.events.KeyboardEvent;
		
		

		public class UI extends MovieClip 
		{
			private var Bg = new startBg;
			private var Sb = new btn_Start;
			private var Tt = new btn_Tut;
			private var Te = new Title;
			private var Ib = new infoBar;
			private var Hb = new health_Bar;
			private var Er = new exp_Bar;
			private var S1 = new Skill1;
			private var S2 = new Skill2;
			private var S3 = new Skill3;
			private var Gn = new Gun;
			private var N1 = new Nu1;
			private var N2 = new Nu2;
			private var N3 = new Nu3;
			private var Cs2 = new cooldownS2;
			
			
			
			
			
					public function UI() 
					{
						addChild(Bg);
						Bg.x = 500;
						Bg.y = 350;
						
						addChild(Sb);
						Sb.x = 500;
						Sb.y = 430;
						
						addChild(Tt);
						Tt.x = 500;
						Tt.y = 600;
						
						addChild(Te);
						
						Te.x = 488;
						Te.y = 100;
						
						Sb.addEventListener(MouseEvent.CLICK,clicked);
						stage.addEventListener(KeyboardEvent.KEY_DOWN,pressed);
						stage.addEventListener(KeyboardEvent.KEY_UP,released);
						S1.stop();
						S2.stop();
						S3.stop();
						
						
					}
					
					public function clicked(e:MouseEvent):void
					{
						removeChild(Bg);
						removeChild(Sb);
						removeChild(Tt);
						removeChild(Te);
						
						addChild(Ib);
						Ib.y = 620;
						
						addChild(Hb);
						Hb.y = 630;
						Hb.x = 234;
						
						addChild(Er);
						Er.y = 655;
						Er.x = 236;
						
						addChild(S1);
						S1.y = 649;
						S1.x = 470;
						
						addChild(S2);
						S2.y = 649;
						S2.x = 570;
						
						addChild(S3);
						S3.y = 649;
						S3.x = 670;
						
						addChild(N1);
						N1.y = 676;
						N1.x = 465;
						addChild(N2);
						N2.y = 676;
						N2.x = 565;
						addChild(N3);
						N3.y = 676;
						N3.x = 665;
						
						
						
					}
					public function pressed(e:KeyboardEvent):void
					{
						if (e.keyCode == 49)
						{
							S1.gotoAndStop(2);
						}
						
						if(e.keyCode == 50)
						{
							S2.gotoAndStop(2);
						}
						
						if(e.keyCode == 51)
						{
							S3.gotoAndStop(2);
						}
						
					}
					public function released(e:KeyboardEvent):void
					{
						if (e.keyCode == 49)
						{
							S1.gotoAndStop(1);
						}
						
						if(e.keyCode == 50)
						{
							S2.gotoAndStop(1);
							
							
						}
						
						if(e.keyCode == 51)
						{
							S3.gotoAndStop(1);
						}
					}
					
					
					
					
					
					
					
					
					
					
					
		}
	
}
