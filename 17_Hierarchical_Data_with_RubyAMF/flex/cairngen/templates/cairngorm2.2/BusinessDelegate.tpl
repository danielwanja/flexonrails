package @namespace@.@business@ {
	
	import @namespace@.@business@.Services;
	import com.adobe.cairngorm.business.ServiceLocator;
	import mx.rpc.IResponder;
	import mx.rpc.AsyncToken;
	
	public class @sequence@Delegate {
		private var responder:IResponder;
		
		public function @sequence@Delegate(responder:IResponder) {
			this.responder = responder;
		}
	}
}