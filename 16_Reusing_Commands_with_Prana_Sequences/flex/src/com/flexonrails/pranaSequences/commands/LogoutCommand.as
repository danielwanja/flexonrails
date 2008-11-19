package com.flexonrails.pranaSequences.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexonrails.pranaSequences.business.SessionDelegate;
	import com.flexonrails.pranaSequences.events.LogoutEvent;
	import com.flexonrails.pranaSequences.model.ModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LogoutCommand implements ICommand, IResponder {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LogoutEvent = event as LogoutEvent;
			var delegate:SessionDelegate = new SessionDelegate(this);
			delegate.logout();
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			model.appState = ModelLocator.LOGGED_OUT;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
			Alert.show("Error while logging out: " + fault.message);
		}
		
	}
}