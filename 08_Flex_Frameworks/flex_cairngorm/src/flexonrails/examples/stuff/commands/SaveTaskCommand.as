package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.business.TasksDelegate;
	import flexonrails.examples.stuff.events.SaveTaskEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	import flexonrails.examples.stuff.vo.Task;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class SaveTaskCommand implements ICommand, IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		private var task:Task;
		
		public function execute(event:CairngormEvent):void {
			var evt:SaveTaskEvent = event as SaveTaskEvent;
			var delegate:TasksDelegate = new TasksDelegate(this);
			task = evt.task;
			delegate.save(task, evt.context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var returnedTask:Task = result.result as Task;
			if (task.newTask) {
				task.id = returnedTask.id; // in case the task was new
				task.createdAt = returnedTask.createdAt;
				task.newTask = false;
			}
			task.updatedAt = returnedTask.updatedAt;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}