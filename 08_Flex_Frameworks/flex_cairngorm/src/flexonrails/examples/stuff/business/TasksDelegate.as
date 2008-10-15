package flexonrails.examples.stuff.business {
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import flexonrails.examples.stuff.vo.Context;
	import flexonrails.examples.stuff.vo.Task;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class TasksDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject;
		
		public function TasksDelegate(responder:IResponder) {
			this.responder = responder;
			service = ServiceLocator.getInstance().getRemoteObject('tasksService');
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

	}
}