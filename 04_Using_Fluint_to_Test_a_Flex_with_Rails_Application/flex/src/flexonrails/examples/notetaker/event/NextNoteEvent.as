package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class NextNoteEvent extends CairngormEvent
	{
		
		public static var EVENT_NEXT_NOTE : String = "NextNote";
				
		public function NextNoteEvent()
		{
			super(EVENT_NEXT_NOTE);
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new NextNoteEvent();
		}	
		
	}
}