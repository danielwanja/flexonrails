package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class NoteChangedEvent extends CairngormEvent
	{
		
		public static var EVENT_NOTE_CHANGED : String = "NoteChanged";
				
		public function NoteChangedEvent()
		{
			super(EVENT_NOTE_CHANGED);
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new NoteChangedEvent();
		}	
		
	}
}