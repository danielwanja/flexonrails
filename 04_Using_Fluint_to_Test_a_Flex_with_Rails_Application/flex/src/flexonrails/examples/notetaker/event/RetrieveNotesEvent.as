package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class RetrieveNotesEvent extends CairngormEvent
	{
		
		public static var EVENT_RETRIEVE_NOTES : String = "RetrieveNotes";
				
		public function RetrieveNotesEvent()
		{
			super(EVENT_RETRIEVE_NOTES);
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new RetrieveNotesEvent();
		}	
		
	}
}