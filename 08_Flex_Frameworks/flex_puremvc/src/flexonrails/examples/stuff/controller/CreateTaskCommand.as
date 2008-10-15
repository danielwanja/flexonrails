package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.model.vo.Context;
	import flexonrails.examples.stuff.model.vo.Task;
	
	import mx.collections.ArrayCollection;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CreateTaskCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			var context:Context = notification.getBody() as Context;
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