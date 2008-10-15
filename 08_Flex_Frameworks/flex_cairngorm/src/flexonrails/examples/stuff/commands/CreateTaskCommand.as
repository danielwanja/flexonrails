package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.events.CreateTaskEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	import flexonrails.examples.stuff.vo.Context;
	import flexonrails.examples.stuff.vo.Task;
	
	import mx.collections.ArrayCollection;

	public class CreateTaskCommand implements ICommand {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:CreateTaskEvent = event as CreateTaskEvent;
			var context:Context = evt.context;
			if (context.tasks == null) {
				context.tasks = new ArrayCollection();
			}
			var task:Task = new Task();
			task.newTask = true;
			task.contextId = context.id;
			task.label = "Unsaved Task";
			context.tasks.addItem(task);
		}
		
	}
}