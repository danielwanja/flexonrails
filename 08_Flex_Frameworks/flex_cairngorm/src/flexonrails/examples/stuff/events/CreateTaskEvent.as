package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;

	public class CreateTaskEvent extends CairngormEvent {
		
		public static const CreateTask_Event:String = "<CreateTaskEvent>";
		
		public var context:Context;
		
		public function CreateTaskEvent(context:Context) {
			super(CreateTask_Event);
			this.context = context;
		}
	}
}