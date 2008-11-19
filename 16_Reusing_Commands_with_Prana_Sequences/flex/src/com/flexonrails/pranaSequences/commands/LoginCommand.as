package com.flexonrails.pranaSequences.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexonrails.pranaSequences.business.SessionDelegate;
	import com.flexonrails.pranaSequences.events.LoginEvent;
	import com.flexonrails.pranaSequences.model.ModelLocator;
	import com.flexonrails.pranaSequences.vo.User;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoginCommand implements ICommand, IResponder {
	
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LoginEvent = event as LoginEvent;
			var delegate:SessionDelegate = new SessionDelegate(this);
			delegate.login(evt.username, evt.password);
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var user:User = result.result as User;
			model.user = user;
			model.appState = ModelLocator.LOGGED_IN;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
			Alert.show(fault.fault.message, "Error Logging In");
		}
	}
}