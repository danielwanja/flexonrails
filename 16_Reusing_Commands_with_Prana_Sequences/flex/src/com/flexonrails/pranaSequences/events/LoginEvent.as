package com.flexonrails.pranaSequences.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoginEvent extends CairngormEvent {
		
		public static const Login_Event:String = "<LoginEvent>";
		
		public var username:String;
		public var password:String;
		
		public function LoginEvent(username:String, password:String) {
			super(Login_Event);
			this.username = username;
			this.password = password;
		}
	}
}