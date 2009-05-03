package resources
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.http.mxml.HTTPService;
	
	public class ActiveResource extends EventDispatcher
	{

		public static const HOST:String =  "http://localhost:3000"; // In production this is relative to the server i.e. '/'
	
		[Bindable]public var index:HTTPService;
		[Bindable]public var show:HTTPService;
		[Bindable]public var create:HTTPService;
		[Bindable]public var update:HTTPService;
		[Bindable]public var destroy:HTTPService;
		
		private var _resourceName:String;
		private var _id:String;
		private var _prefix:String=""; 
		
		private var customActions:Object = {}
		private var _collection:XML; // Used during setup to define custom collection actions
		private var _member:XML; // Used during setup to defined custom member actions
				
		public function ActiveResource(target:IEventDispatcher=null)
		{
			super(target);
		}		
		
		public function set collection(value:XML):void {
			_collection = value;
			setup();
			dispatchEvent(new Event('resourceChanged'));			
		}
		public function get collection():XML {
			return _collection;	
		}
		public function set member(value:XML):void {
			_member = value;
		}
		public function get member():XML {
			return _member
		}	
			
		[Bindable(event='resourceChanged')]
		public function get id():String {
			return _id;
		}
		public function set id(value:String):void {
			_id = value;
			setup();
			dispatchEvent(new Event('resourceChanged'));
		}
	
		[Bindable(event='resourceChanged')]
		public function get resoureName():String {
			return _resourceName;
		}
		public function set resoureName(value:String):void {
			_resourceName = value;
			setup();
			dispatchEvent(new Event('resourceChanged'));
		}
		
		[Bindable(event='resourceChanged')]
		public function get resource():String {
			return  _prefix+"/"+_resourceName+"/"+_id;
		}
		[Bindable(event='resourceChanged')]
		public function get resources():String {
			return  _prefix+"/"+_resourceName
		}
		
		
		[Bindable(event='resourceChanged')]
		public function get prefix():String {
			return _prefix;
		}
		public function set prefix(value:String):void {
			_prefix = value;
			setup();
			dispatchEvent(new Event('resourceChanged'));
		}
		 
		//TODO: optimize as we don't need to recreate for each change in id.
	    private function setup():void {
			if (_resourceName==null)return;
			index =   getHTTPService(index,   'GET');
			index.contentType = null;
			show =    getHTTPService(show,    'GET', _id);
			create =  getHTTPService(create,  'POST');
			update =  getHTTPService(update,  'PUT', _id);  //FIXME: not used for now but PUT is not supported by Flex
			destroy = getHTTPService(destroy, 'DELETE', _id);
			if (_collection!=null) {
				for each (var verb:XML in _collection.children()) {
					var verbName:String = verb.name();
					customActions[verbName] = getHTTPService(customActions[verbName], verb.toString(), null, verbName)
					
				}
			}
			if (_member!=null) {
				for each (verb in _member.children()) {
					verbName = verb.name();
					customActions[verbName] = getHTTPService(customActions[verbName], verb.toString(), _id, verbName)
				}
			}
			
		} 
		
		public function getCustomAction(verbName:String):HTTPService {
			return customActions[verbName];
		}
		
		//FIXME: find better name than customVerb
		private function getHTTPService(http:HTTPService, method:String, id:String=null, customVerb:String=null):HTTPService {
			if (http==null) http = new HTTPService();
			http.url = id ? HOST+resource : HOST+resources;			
			if (customVerb!=null) http.url += "/"+customVerb
			if (http==destroy) http.url += "?_method=delete"  //FIXME: use encode URL.
			if (http==update) http.headers={X_HTTP_METHOD_OVERRIDE:'put'};			
			http.method = method;
			http.resultFormat = "e4x";
			http.contentType = "application/xml";
			return http;
		}
		
		
		
	}
}