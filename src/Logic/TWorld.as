package Logic 
{
	/**
	 * ...
	 * @author 
	 */
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Logic.TShip;
	import Logic.TMeteorite;

	public class TWorld extends Sprite
	{
		private var myTimer:Timer;
		private var k:int;
		public var status:String;
		public var ship:TShip;
		
		
		public function TWorld() 
		{
			k = 0;
			
			mouseEnabled = true;
			
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			return;
		}
		public function onAdded(event:Event):void
		{
			ship = new TShip();
			stage.addChild(ship);
			
			myTimer = new Timer(1000);
			myTimer.start();
			
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
		}
		private function timerHandler(e:TimerEvent):void
		{
			k++;
			if (k == 1 )
			{
				var meteor:TMeteorite = new TMeteorite();
				stage.addChild(meteor);
			}
			//status = "k=" + k;
        }
		public function onClick(event:MouseEvent):void
		{
			status = "clicked";
		}
	}

}