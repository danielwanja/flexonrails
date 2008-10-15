package flexonrails.examples.stuff.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoadAllContextsEvent extends CairngormEvent {
		public static const LoadAllContexts_Event:String = "<LoadAllContextsEvent>";
		
		public function LoadAllContextsEvent()  {
			super(LoadAllContexts_Event);
		}
	}
}