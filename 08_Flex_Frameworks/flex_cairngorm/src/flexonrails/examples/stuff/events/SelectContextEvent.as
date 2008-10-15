package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.vo.Context;

	public class SelectContextEvent extends CairngormEvent {
		public static const SelectContext_Event:String = "<SelectContextEvent>";
		
		public var context:Context;
		
		public function SelectContextEvent(context:Context) {
			super(SelectContext_Event);
			this.context = context;
		}
	}
}