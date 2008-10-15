package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;

	public class DeleteContextEvent extends CairngormEvent {
		public static const DeleteContext_Event:String = "<DeleteContextEvent>";
		
		public var context:Context;
		
		public function DeleteContextEvent(context:Context) {
			super(DeleteContext_Event);
			this.context = context;
		}
	}
}