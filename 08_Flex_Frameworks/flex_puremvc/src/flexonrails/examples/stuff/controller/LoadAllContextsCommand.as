package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.business.ContextsDelegate;
	import flexonrails.examples.stuff.model.ContextProxy;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class LoadAllContextsCommand extends SimpleCommand implements IResponder {
		
		override public function execute(notification:INotification):void {
			var delegate:ContextsDelegate = new ContextsDelegate(this);
			delegate.loadAll();
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var contextProxy:ContextProxy = facade.retrieveProxy(ContextProxy.NAME) as ContextProxy;
			contextProxy.reload(result.result as Array);
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}