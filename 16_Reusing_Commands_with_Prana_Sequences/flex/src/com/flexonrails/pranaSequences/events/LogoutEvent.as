package com.flexonrails.pranaSequences.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LogoutEvent extends CairngormEvent {
		public static const Logout_Event:String = "<LogoutEvent>";
		
		public function LogoutEvent()  {
			super(Logout_Event);
		}
	}
}