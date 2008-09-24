package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class EditNoteEvent extends CairngormEvent
	{
		
		public static var EVENT_EDIT_NOTE : String = "EditNote";
				
		public function EditNoteEvent(selectedNote:Object=null)
		{
			super(EVENT_EDIT_NOTE);
			data = selectedNote;
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new EditNoteEvent();
		}	
		
	}
}