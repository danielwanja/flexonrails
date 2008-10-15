package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.business.TasksDelegate;
	import flexonrails.examples.stuff.events.LoadAllTasksEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	import flexonrails.examples.stuff.vo.Context;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadTasksCommand implements ICommand, IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		private var context:Context;
		
		public function execute(event:CairngormEvent):void {
			var evt:LoadAllTasksEvent = event as LoadAllTasksEvent;
			var delegate:TasksDelegate = new TasksDelegate(this);
			context = evt.context;
			delegate.loadAll(context);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			context.tasks = new ArrayCollection(result.result as Array);
			context.tasksLoaded = true;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}