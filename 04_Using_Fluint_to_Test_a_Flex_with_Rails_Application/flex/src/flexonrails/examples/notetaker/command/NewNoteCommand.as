package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( NewNoteEvent.EVENT_NEW_NOTE, NewNoteCommand );
	*/
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class NewNoteCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			NotetakerModelLocator.getInstance().selectedNote = <note><body></body></note>;
			NotetakerModelLocator.getInstance().currentView = NotetakerModelLocator.EDIT_VIEW;			
		}				
	}
}