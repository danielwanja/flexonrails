package com.flexonrails.outliner.business {
	
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.flexonrails.outliner.vo.OutlinePoint;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class OutlinePointsDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject
		
		public function OutlinePointsDelegate(responder:IResponder) {
			this.responder = responder;
			
			service = ServiceLocator.getInstance().getRemoteObject(Services.OUTLINE_POINTS_SERVICE);
		}
		
		public function findRootOutlinePoint():void {
			addResponder(service.find_root())
		}

		private function addResponder(serviceCall:*):void {
			var token:AsyncToken = serviceCall;
			token.addResponder(responder);
		}
	}
}