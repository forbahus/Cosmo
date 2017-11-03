package Logic
{
	/**
	 * ...
	 * @author
	 */
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Logic.TShipSection;
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	public class TShip extends Sprite
	{
		//embed assets
		[Embed(source="../../images/redshipr.png")]
		private var shipClass:Class;
		private var shipSprite:Bitmap = new shipClass();
		
		private var myTimer:Timer;
		
		private var frontSide:TShipSection; // перед
		private var backSide:TShipSection; // корма (жопа)
		private var leftSide:TShipSection; // левый борт
		private var rightSide:TShipSection; // правый борт
		
		public function TShip() 
		{
			myTimer = new Timer(10);
			myTimer.start();
			
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			return;
		}
		public function onAdded(event:Event):void
		{
			shipSprite.width = 192;
			shipSprite.height = 92;
			shipSprite.rotationZ = -90;
			
			shipSprite.x = (stage.width - shipSprite.width ) / 2;
			shipSprite.y = (stage.height) / 2 + shipSprite.height;

			addChild(shipSprite);
			
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		private function timerHandler(e:TimerEvent):void
		{
        }
	}

}