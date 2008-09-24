package flexonrails.examples.notetaker.command
{
	/* add to controller
	addCommand( BackToListEvent.EVENT_BACK_TO_LIST, BackToListCommand );
	*/
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.commands.ICommand;

	import flexonrails.examples.notetaker.model.NotetakerModelLocator;
	import flexonrails.examples.notetaker.event.BackToListEvent;

	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;

	public class BackToListCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			NotetakerModelLocator.getInstance().currentView = NotetakerModelLocator.LIST_VIEW;
			NotetakerModelLocator.getInstance().selectedNote = null;
		}
		
		
	}
}