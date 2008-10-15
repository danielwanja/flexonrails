package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.business.ContextsDelegate;
	import flexonrails.examples.stuff.model.ContextProxy;
	import flexonrails.examples.stuff.model.vo.Context;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class SaveContextCommand extends SimpleCommand implements IResponder {
		
		private var contextProxy:ContextProxy;
		private var context:Context;
		
		override public function execute(notification:INotification):void {
			contextProxy = facade.retrieveProxy(ContextProxy.NAME) as ContextProxy;
			context = notification.getBody() as Context;
			var delegate:ContextsDelegate = new ContextsDelegate(this);
			delegate.save(context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var newContext:Context = result.result as Context;
			if (context.id == 0) { // context was new
				contextProxy.addItem(newContext);
			} else {
				contextProxy.updateItem(newContext);
			}
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}