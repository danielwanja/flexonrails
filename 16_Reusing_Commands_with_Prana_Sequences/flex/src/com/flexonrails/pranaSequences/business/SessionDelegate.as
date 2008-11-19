package com.flexonrails.pranaSequences.business {
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class SessionDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject
		
		public function SessionDelegate(responder:IResponder) {
			this.responder = responder;
			
			service = ServiceLocator.getInstance().getRemoteObject(Services.SESSIONS_SERVICE);
		}
		
		public function login(username:String, password:String):void {
			addResponder(service.create({login:username, password:password}));
		}
		
		public function logout():void {
			addResponder(service.destroy());
		}
		
		private function addResponder(serviceCall:*):void {
			var token:AsyncToken = serviceCall;
			token.addResponder(responder);
		}
	}
}