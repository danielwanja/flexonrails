package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.business.ContextsDelegate;
	import flexonrails.examples.stuff.events.DeleteContextEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	import flexonrails.examples.stuff.vo.Context;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class DeleteContextCommand implements ICommand, IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		private var context:Context;
		
		public function execute(event:CairngormEvent):void {
			var evt:DeleteContextEvent = event as DeleteContextEvent;
			var delegate:ContextsDelegate = new ContextsDelegate(this);
			context = evt.context;
			delegate.destroy(context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var index:int = model.contexts.getItemIndex(context);
			if (index > -1) {
				model.contexts.removeItemAt(index);
			}
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}