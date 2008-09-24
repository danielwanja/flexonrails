package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( EditNoteEvent.EVENT_EDIT_NOTE, EditNoteCommand );
	*/
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.commands.ICommand;

	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	import flexonrails.examples.notetaker.event.EditNoteEvent;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class EditNoteCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			//FIXME: handle null data (do nothing)
			NotetakerModelLocator.getInstance().selectedNote = event.data;
			NotetakerModelLocator.getInstance().currentView = NotetakerModelLocator.EDIT_VIEW;
		}
				
	}
}