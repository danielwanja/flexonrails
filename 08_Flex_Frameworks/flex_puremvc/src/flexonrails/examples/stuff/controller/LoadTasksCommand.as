package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.ApplicationFacade;
	import flexonrails.examples.stuff.business.TasksDelegate;
	import flexonrails.examples.stuff.model.vo.Context;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class LoadTasksCommand extends SimpleCommand implements IResponder {
		
		private var context:Context;
		
		override public function execute(notification:INotification):void {
			var delegate:TasksDelegate = new TasksDelegate(this);
			context = notification.getBody() as Context;
			delegate.loadAll(context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			context.tasks = new ArrayCollection(result.result as Array);
			context.tasksLoaded = true;
			sendNotification(ApplicationFacade.TASKS_LOADED, context.tasks);
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}