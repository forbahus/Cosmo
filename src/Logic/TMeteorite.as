package Logic 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 
	 */
	public class TMeteorite extends Sprite
	{
		[Embed(source = "../../images/meteor.png")]
		private var meteorClass:Class;
		private var meteorSprite:Bitmap = new meteorClass();
		
		public function TMeteorite() 
		{
			super();
			
			mouseEnabled = true;
			
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		public function onAdded(event:Event):void
		{
			this.width = 150;
			this.height = 150;
			this.x = 100;
			this.y = 100;
			meteorSprite.x = 100;
			meteorSprite.y = 100;
			
			meteorSprite.width = 50;
			meteorSprite.height = 50;
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			
			stage.addChild(meteorSprite);
		}
		public function onClick(event:MouseEvent):void
		{
			stage.removeChild(meteorSprite);
		}
		public function destroy():void
		{
			
		}
	}

}