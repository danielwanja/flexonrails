package flexonrails.examples.notetaker.event
{
	import flash.events.Event;
	import mx.utils.ObjectUtil;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class SaveChangeEvent extends CairngormEvent
	{
		
		public static var EVENT_SAVE_CHANGE : String = "SaveChange";
				
		public function SaveChangeEvent(body:String=null, selectedNote:XML=null)
		{
			super(EVENT_SAVE_CHANGE);
			data = {body:body, note:selectedNote};
		}
		
     	/**
     	 * Override the inherited clone() method, but don't return any state.
     	 */
		override public function clone() : Event
		{
			return new SaveChangeEvent();
		}	
		
	}
}