package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class DeleteNoteEvent extends CairngormEvent
	{
		
		public static var EVENT_DELETE_NOTE : String = "DeleteNote";
				
		public function DeleteNoteEvent(noteId:String=null)
		{
			super(EVENT_DELETE_NOTE);
			data = noteId;
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new DeleteNoteEvent();
		}	
		
	}
}