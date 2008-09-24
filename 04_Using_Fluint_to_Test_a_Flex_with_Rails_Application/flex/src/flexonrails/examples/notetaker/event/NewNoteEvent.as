package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class NewNoteEvent extends CairngormEvent
	{
		
		public static var EVENT_NEW_NOTE : String = "NewNote";
				
		public function NewNoteEvent()
		{
			super(EVENT_NEW_NOTE);
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new NewNoteEvent();
		}	
		
	}
}