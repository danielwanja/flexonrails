package @namespace@.@commands@ {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import @namespace@.@business@.@sequence@Delegate;
	import @namespace@.@events@.@sequence@Event;
	import @namespace@.model.ModelLocator;
	
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	
	public class @sequence@Command implements ICommand, IResponder {
	
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:@sequence@Event = event as @sequence@Event;
			var delegate:@sequence@Delegate = new @sequence@Delegate(this);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}