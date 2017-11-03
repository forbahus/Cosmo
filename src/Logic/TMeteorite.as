package Logic 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
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
			
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		public function onAdded(event:Event):void
		{
			meteorSprite.x = 100;
			meteorSprite.y = 100;
			
			meteorSprite.width = 50;
			meteorSprite.height = 50;

			stage.addChild(meteorSprite);
			
			this.removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
	}

}