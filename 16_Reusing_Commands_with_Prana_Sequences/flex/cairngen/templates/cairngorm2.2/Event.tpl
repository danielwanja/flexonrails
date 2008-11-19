package @namespace@.@events@ {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class @sequence@Event extends CairngormEvent {
		public static const @sequence@_Event:String = "<@sequence@Event>";
		
		public function @sequence@Event()  {
			super(@sequence@_Event);
		}
	}
}