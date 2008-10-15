package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.business.TasksDelegate;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class SelectContextCommand extends SimpleCommand implements IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		private var context:Context;
		
		public function execute(event:CairngormEvent):void {
			var evt:SelectContextEvent = event as SelectContextEvent;
			context = evt.context;
			model.selectedContext = context;
			if (!context.tasksLoaded) {
				var delegate:TasksDelegate = new TasksDelegate(this);
				delegate.loadAll(context);
			}
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var tasks:Array = result.result as Array;
			context.tasks = new ArrayCollection(tasks);
			context.tasksLoaded = true;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
		
	}
}