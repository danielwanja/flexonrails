package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( DeleteNoteEvent.EVENT_DELETE_NOTE, DeleteNoteCommand );
	*/
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.notetaker.business.NoteDelegate;
	import flexonrails.examples.notetaker.event.DeleteNoteEvent;
	import flexonrails.examples.notetaker.event.RetrieveNotesEvent;
	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class DeleteNoteCommand extends SequenceCommand implements IResponder
	{
		
		public function DeleteNoteCommand() {
			super(new RetrieveNotesEvent());			
		}
		
		override public function execute(event:CairngormEvent):void
		{
		    var delegate : NoteDelegate = new NoteDelegate( this );
		    delegate.destroy(DeleteNoteEvent(event).data)
		}
		
		public function result(data:Object):void
		{
			executeNextCommand();
			NotetakerModelLocator.getInstance().currentView = NotetakerModelLocator.LIST_VIEW;
		}
		
		public function fault(info:Object):void
		{
			var faultEvent :FaultEvent = FaultEvent( info )
			Alert.show( "fault at DeleteNote" )
		}
		
	}
}