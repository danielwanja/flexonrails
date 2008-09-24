package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class BackToListEvent extends CairngormEvent
	{
		
		public static var EVENT_BACK_TO_LIST : String = "BackToList";
				
		public function BackToListEvent()
		{
			super(EVENT_BACK_TO_LIST);
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new BackToListEvent();
		}	
		
	}
}