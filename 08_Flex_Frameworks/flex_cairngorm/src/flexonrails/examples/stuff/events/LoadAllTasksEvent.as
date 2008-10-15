package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;

	public class LoadAllTasksEvent extends CairngormEvent {
		public static const LoadAllTasks_Event:String = "<LoadAllTasksEvent>";
		
		public var context:Context;
		
		public function LoadAllTasksEvent(context:Context) {
			super(LoadAllTasks_Event);
			this.context = context;
		}
	}
}