package flexonrails.examples.stuff.business {
	
	import flexonrails.examples.stuff.model.vo.Context;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class ContextsDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject;
		
		public function ContextsDelegate(responder:IResponder) {
			this.responder = responder;
			createService();
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

		private function createService():void {
			service = new RemoteObject('rubyamf');
			service.source = 'ContextsController';
			service.endpoint = "http://localhost:3000/rubyamf_gateway/"
			service.showBusyCursor = true;
		}
		
	}
}