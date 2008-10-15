package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;
	import flexonrails.examples.stuff.vo.Task;

	public class SaveTaskEvent extends CairngormEvent {
		public static const SaveTask_Event:String = "<SaveTaskEvent>";
		
		public var task:Task;
		public var context:Context;
		
		public function SaveTaskEvent(task:Task, context:Context) {
			super(SaveTask_Event);
			this.task = task;
			this.context = context;
		}
	}
}