package flexonrails.examples.stuff.business {
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flexonrails.examples.stuff.vo.Context;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class ContextsDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject;
		
		public function ContextsDelegate(responder:IResponder) {
			this.responder = responder;
			service = ServiceLocator.getInstance().getRemoteObject('contextsService');
		}
		
		public function loadAll():void {
			var call:AsyncToken = service.load_all();
			call.addResponder(responder);
		}

		public function save(context:Context):void {
			var call:AsyncToken = service.save({context:context});
			call.addResponder(responder);
		}

		public function destroy(context:Context):void {
			var call:AsyncToken = service.destroy({id:context.id});
			call.addResponder(responder);
		}

	}
}