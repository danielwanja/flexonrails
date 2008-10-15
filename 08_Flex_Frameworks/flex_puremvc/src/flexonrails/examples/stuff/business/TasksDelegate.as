package flexonrails.examples.stuff.business {
	
	import flexonrails.examples.stuff.model.vo.Context;
	import flexonrails.examples.stuff.model.vo.Task;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class TasksDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject;
		
		public function TasksDelegate(responder:IResponder) {
			this.responder = responder;
			createService();
		}
		
		public function loadAll(context:Context):void {
			var call:AsyncToken = service.load_all({context_id:context.id});
			call.addResponder(responder);
		}

		public function save(task:Task, context:Context):void {
			var call:AsyncToken = service.save({task:task, context_id:context.id});
			call.addResponder(responder);
		}

		public function destroy(task:Task, context:Context):void {
			var call:AsyncToken = service.destroy({id:task.id, context_id:context.id});
			call.addResponder(responder);
		}
		
		private function createService():void {
			service = new RemoteObject('rubyamf');
			service.source = 'TasksController';
			service.endpoint = "http://localhost:3000/rubyamf_gateway/"
			service.showBusyCursor = true;
		}

	}
}