package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( SaveChangeEvent.EVENT_SAVE_CHANGE, SaveChangeCommand );
	*/
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.notetaker.business.NoteDelegate;
	import flexonrails.examples.notetaker.event.RetrieveNotesEvent;
	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class SaveChangeCommand extends SequenceCommand implements IResponder
	{
		public function SaveChangeCommand() {
			super(new RetrieveNotesEvent());
		}
		
		override public function execute(event:CairngormEvent):void
		{
		    var delegate : NoteDelegate = new NoteDelegate( this )
		    var note:XML = new XML(event.data.note);
		    note.body  =  event.data.body;
		    note.title = note.body.split("\r")[0];  //FIXME: check if that also works on Windows.
		    if (note.id.toString() == "") {
		    	delegate.create(note)
		    } else {
		    	delegate.update(note)		    	
		    }
		}
		
		public function result(data:Object):void
		{
			executeNextCommand();
			NotetakerModelLocator.getInstance().currentView = NotetakerModelLocator.LIST_VIEW;
		}
		
		public function fault(info:Object):void
		{
			var faultEvent :FaultEvent = FaultEvent( info )
			Alert.show( "fault at SaveChange" )
		}
		
	}
}