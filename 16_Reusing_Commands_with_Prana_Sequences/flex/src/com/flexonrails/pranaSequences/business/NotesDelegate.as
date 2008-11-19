package com.flexonrails.pranaSequences.business {
	
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.flexonrails.pranaSequences.vo.Note;
	import com.flexonrails.pranaSequences.vo.User;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class NotesDelegate {
		
		private var responder:IResponder;
		private var service:RemoteObject
		
		public function NotesDelegate(responder:IResponder) {
			this.responder = responder;
			
			service = ServiceLocator.getInstance().getRemoteObject(Services.NOTES_SERVICE);
		}
		
		public function findAllForCurrentUser():void {
			addResponder(service.find_all())
		}
		
		public function findById(noteId:Number):void {
			
		}
		
		public function save(note:Note):void {
			
		}
		
		public function destroy(node:Note):void {
			
		}
		
		private function addResponder(serviceCall:*):void {
			var token:AsyncToken = serviceCall;
			token.addResponder(responder);
		}
	}
}