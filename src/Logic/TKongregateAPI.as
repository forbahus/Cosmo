package Logic 
{
	/**
	 * ...
	 * @author 
	 */
	import flash.display.Sprite;
	import flash.display.LoaderInfo;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.system.Security;
	import mx.flash.UIMovieClip;
	import flash.display.Stage;
	
	import flash.text.TextField;

	public class TKongregateAPI extends UIMovieClip
	{
		// Kongregate API reference
		public var kongregate:*;
		public var status:String;

		public function TKongregateAPI() 
		{
		}
		public function APILoad(): void
		{
			// Pull the API path from the FlashVars
			var paramObj:Object = LoaderInfo(loaderInfo).parameters;
				
			// The API path. The "shadow" API will load if testing locally. 
			var apiPath:String = paramObj.kongregate_api_path || 
				 "http://cdn1.kongregate.com/flash/API_AS3_Local.swf";
				  
			// Allow the API access to this SWF
			Security.allowDomain(apiPath);
			Security.allowInsecureDomain(apiPath);
			
			// Load the API
			var request:URLRequest = new URLRequest("http://cdn1.kongregate.com/flash/API_AS3_Local.swf");
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(request);
		}
		// This function is called when loading is complete
		private function loadComplete(event:Event):void
		{
			// Save Kongregate API reference
			kongregate = event.target.content;
				
			stage.addChild(kongregate);

			// Connect to the back-end
			kongregate.services.connect();

			status = "kongregate loaded";
		}
	}

}