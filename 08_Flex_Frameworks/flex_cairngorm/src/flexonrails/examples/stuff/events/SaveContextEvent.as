package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;

	public class SaveContextEvent extends CairngormEvent {
		public static const SaveContext_Event:String = "<SaveContextEvent>";
		
		public var context:Context;
		
		public function SaveContextEvent(context:Context)  {
			super(SaveContext_Event);
			this.context = context;
		}
	}
}