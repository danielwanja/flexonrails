package com.flexonrails.pranaSequences.sequences {
	
	import com.flexonrails.pranaSequences.events.*;
	import com.flexonrails.pranaSequences.model.ModelLocator;
	
	import org.pranaframework.cairngorm.EventSequence;
	import org.pranaframework.utils.Property;

	public class LoginSequence extends EventSequence {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function LoginSequence(username:String, password:String) {
			super();
			
			addSequenceEvent(LoginEvent, [username, password]);
			addSequenceEvent(LoadUserNotesEvent, null, [new Property(model, "user")]);
			
		}
		
	}
}