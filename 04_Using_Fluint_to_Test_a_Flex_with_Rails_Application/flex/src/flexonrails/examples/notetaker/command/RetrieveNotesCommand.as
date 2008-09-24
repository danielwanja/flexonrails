package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( RetrieveNotesEvent.EVENT_RETRIEVE_NOTES, RetrieveNotesCommand );
	*/
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.commands.ICommand;

	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	import flexonrails.examples.notetaker.business.NoteDelegate;	import flexonrails.examples.notetaker.event.RetrieveNotesEvent;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class RetrieveNotesCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
		    var delegate : NoteDelegate = new NoteDelegate( this );
		    delegate.list()
		}
		
		public function result(data:Object):void
		{
			NotetakerModelLocator.getInstance().notes = data.result;
		}
		
		public function fault(info:Object):void
		{
			var faultEvent :FaultEvent = FaultEvent( info )
			Alert.show( "fault at RetrieveNotes" )
		}
		
	}
}