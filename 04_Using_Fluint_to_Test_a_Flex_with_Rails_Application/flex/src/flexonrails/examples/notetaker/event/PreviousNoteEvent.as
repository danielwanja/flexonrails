package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PreviousNoteEvent extends CairngormEvent
	{
		
		public static var EVENT_PREVIOUS_NOTE : String = "PreviousNote";
				
		public function PreviousNoteEvent()
		{
			super(EVENT_PREVIOUS_NOTE);
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new PreviousNoteEvent();
		}	
		
	}
}