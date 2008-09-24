package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( NoteChangedEvent.EVENT_NOTE_CHANGED, NoteChangedCommand );
	*/
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.commands.ICommand;

	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	import flexonrails.examples.notetaker.event.NoteChangedEvent;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class NoteChangedCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
		}
		
		public function result(data:Object):void
		{
			// NotetakerModelLocator.getInstance()
		}
		
		public function fault(info:Object):void
		{
			var faultEvent :FaultEvent = FaultEvent( info )
			Alert.show( "fault at NoteChanged" )
		}
		
	}
}