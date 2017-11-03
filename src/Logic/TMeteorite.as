package Logic 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import Math;
	/**
	 * ...
	 * @author 
	 */
	public class TMeteorite extends Sprite
	{
		[Embed(source = "../../images/meteor.png")]
		private var meteorClass:Class;
		private var meteorSprite:Bitmap = new meteorClass();
		
		private var myTimer:Timer;
		
		public function TMeteorite() 
		{
			super();
			
			mouseEnabled = true;
			
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		public function onAdded(event:Event):void
		{
			meteorSprite.x = Math.random() * stage.width;
			
			meteorSprite.width = 30;
			meteorSprite.height = 30;

			
			myTimer = new Timer(10);
			myTimer.start();
			
			myTimer.addEventListener(TimerEvent.TIMER, timerHandler);

			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			stage.addChild(meteorSprite);
		}
		public function onClick(event:MouseEvent):void
		{
			stage.removeChild(meteorSprite);
		}
		private function timerHandler(e:TimerEvent):void
		{
			meteorSprite.y += 2;
			if (meteorSprite.y > stage.height)
				stage.removeChild(meteorSprite);
		}
		public function destroy():void
		{
		}
	}

}