package com.flexonrails.pranaSequences.control {
	
	import com.adobe.cairngorm.control.FrontController;
	import com.flexonrails.pranaSequences.commands.*;
	import com.flexonrails.pranaSequences.events.*;
    
	public final class PranaSequencesController extends FrontController {

		public function PranaSequencesController() {
			this.initialize();
		}
		
		private function initialize():void {
			//add commands
			addCommand(LoginEvent.Login_Event,					LoginCommand)
			addCommand(LogoutEvent.Logout_Event,				LogoutCommand)
			addCommand(LoadUserNotesEvent.LoadUserNotes_Event,	LoadUserNotesCommand)
		}
	}
}
