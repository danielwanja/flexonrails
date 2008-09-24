package flexonrails.examples.notetaker.control
{
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.FrontController;
	import flexonrails.examples.notetaker.event.*;
	import flexonrails.examples.notetaker.command.*;
	
	public class NotetakerController extends FrontController
	{
		public function NotetakerController()
		{
			initialiseCommands();
		}
		
		public function initialiseCommands() : void
		{
			addCommand( BackToListEvent.EVENT_BACK_TO_LIST, BackToListCommand );
			addCommand( DeleteNoteEvent.EVENT_DELETE_NOTE, DeleteNoteCommand );
			addCommand( EditNoteEvent.EVENT_EDIT_NOTE, EditNoteCommand );
			addCommand( NewNoteEvent.EVENT_NEW_NOTE, NewNoteCommand );
			addCommand( NextNoteEvent.EVENT_NEXT_NOTE, NextNoteCommand );
			addCommand( NoteChangedEvent.EVENT_NOTE_CHANGED, NoteChangedCommand );
			addCommand( PreviousNoteEvent.EVENT_PREVIOUS_NOTE, PreviousNoteCommand );
			addCommand( RetrieveNotesEvent.EVENT_RETRIEVE_NOTES, RetrieveNotesCommand );
			addCommand( SaveChangeEvent.EVENT_SAVE_CHANGE, SaveChangeCommand );
		}	
	}
	
}