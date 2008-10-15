package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;
	import flexonrails.examples.stuff.vo.Task;

	public class DeleteTaskEvent extends CairngormEvent {
		public static const DeleteTask_Event:String = "<DeleteTaskEvent>";
		
		public var task:Task;
		public var context:Context;
		
		public function DeleteTaskEvent(task:Task, context:Context) {
			super(DeleteTask_Event);
			this.task = task;
			this.context = context;
		}
	}
}