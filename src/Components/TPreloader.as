package Components 
{
	/**
	 * ...
	 * @author 
	 */
	import flash.display.Sprite;
	import mx.controls.ProgressBar;
	import mx.preloaders.IPreloaderDisplay;
	import flash.events.*;
	import mx.events.*;
	import mx.preloaders.*; 
	import flash.text.*;
	import flash.utils.Timer;
	import mx.preloaders.DownloadProgressBar;
	
	public class TPreloader extends Sprite implements IPreloaderDisplay
	{
		private var progressText:TextField;
		
		public function TPreloader() 
		{
			super();
			
			progressText = new TextField(); 
			progressText.width = 400;
            progressText.height = 400;		
			progressText.text = "ctor";
			addChild(progressText);
			
		}
		public function initialize():void 
		{
        }
		
        // Specify the event listeners.
        public function set preloader(preloader:Sprite):void {
            // Listen for the relevant events
            preloader.addEventListener(
                ProgressEvent.PROGRESS, handleProgress); 
            preloader.addEventListener(
                Event.COMPLETE, handleComplete);
    
            preloader.addEventListener(
                FlexEvent.INIT_PROGRESS, handleInitProgress);
            preloader.addEventListener(
                FlexEvent.INIT_COMPLETE, handleInitComplete);
        }		
        // Define empty event listeners.
        private function handleProgress(event:ProgressEvent):void 
		{
            progressText.appendText(event.bytesLoaded + " / " + event.bytesTotal + " = " + event.bytesLoaded / event.bytesTotal * 100 + "%");
        }
        
        private function handleComplete(event:Event):void 
		{
        }
        
        private function handleInitProgress(event:Event):void 
		{
        }
        
        private function handleInitComplete(event:Event):void 
		{
            var timer:Timer = new Timer(1000,1);
            timer.addEventListener(TimerEvent.TIMER, dispatchComplete);
            timer.start();      
        }
    
        private function dispatchComplete(event:TimerEvent):void {
            dispatchEvent(new Event(Event.COMPLETE));
        }
        
       // Implement IPreloaderDisplay interface
    
        public function get backgroundColor():uint {
            return 0;
        }
        
        public function set backgroundColor(value:uint):void 
		{
			
        }
        
        public function get backgroundAlpha():Number {
            return 0;
        }
        
        public function set backgroundAlpha(value:Number):void {
        }
        
        public function get backgroundImage():Object {
            return undefined;
        }
        
        public function set backgroundImage(value:Object):void {
        }
        
        public function get backgroundSize():String {
            return "";
        }
        
        public function set backgroundSize(value:String):void {
        }
    
        public function get stageWidth():Number {
            return 200;
        }
        
        public function set stageWidth(value:Number):void {
        }
        
        public function get stageHeight():Number {
            return 200;
        }
        
        public function set stageHeight(value:Number):void {
        }		
	}

}