package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.business.ContextsDelegate;
	import flexonrails.examples.stuff.model.ContextProxy;
	import flexonrails.examples.stuff.model.vo.Context;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class DeleteContextCommand extends SimpleCommand implements IResponder {
		
		private var context:Context;
		private var contextProxy:ContextProxy;
		
		override public function execute(notification:INotification):void {
			contextProxy = facade.retrieveProxy(ContextProxy.NAME) as ContextProxy;
			var delegate:ContextsDelegate = new ContextsDelegate(this);
			context = notification.getBody() as Context;
			delegate.destroy(context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			contextProxy.deleteItem(context);
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}