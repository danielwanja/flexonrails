package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.ApplicationFacade;
	import flexonrails.examples.stuff.business.TasksDelegate;
	import flexonrails.examples.stuff.model.ContextProxy;
	import flexonrails.examples.stuff.model.vo.Context;
	import flexonrails.examples.stuff.model.vo.Task;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class SaveTaskCommand extends SimpleCommand implements IResponder {
		
		private var task:Task;
		
		override public function execute(notification:INotification):void {
			var proxy:ContextProxy = facade.retrieveProxy(ContextProxy.NAME) as ContextProxy;
			var delegate:TasksDelegate = new TasksDelegate(this);
			task = notification.getBody() as Task;
			var context:Context = proxy.findById(task.contextId);
			delegate.save(task, context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var returnedTask:Task = result.result as Task;
			if (task.newTask) { // in case the task was new
				task.id = returnedTask.id;
				task.createdAt = returnedTask.createdAt;
				task.newTask = false;
			}
			task.updatedAt = returnedTask.updatedAt;
			sendNotification(ApplicationFacade.TASK_UPDATED, task);
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}