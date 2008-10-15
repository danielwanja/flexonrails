package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.business.ContextsDelegate;
	import flexonrails.examples.stuff.events.LoadAllContextsEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadAllContextsCommand implements ICommand, IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LoadAllContextsEvent = event as LoadAllContextsEvent;
			var delegate:ContextsDelegate = new ContextsDelegate(this);
			delegate.loadAll();
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			model.contexts = new ArrayCollection(result.result as Array);
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}