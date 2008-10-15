package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.business.TasksDelegate;
	import flexonrails.examples.stuff.events.DeleteTaskEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	import flexonrails.examples.stuff.vo.Context;
	import flexonrails.examples.stuff.vo.Task;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class DeleteTaskCommand implements ICommand, IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		private var context:Context;
		private var task:Task;
		
		public function execute(event:CairngormEvent):void {
			var evt:DeleteTaskEvent = event as DeleteTaskEvent;
			var delegate:TasksDelegate = new TasksDelegate(this);
			context = evt.context;
			task = evt.task;
			delegate.destroy(evt.task, evt.context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var index:int = context.tasks.getItemIndex(task);
			if (index > -1) {
				context.tasks.removeItemAt(index);
			}
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}