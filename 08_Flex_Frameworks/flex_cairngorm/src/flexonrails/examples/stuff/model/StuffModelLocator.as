package flexonrails.examples.stuff.model {
	
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	
	import flexonrails.examples.stuff.vo.*;
	
	import mx.collections.ArrayCollection;
	
    [Bindable]
	public class StuffModelLocator {
		
		//singleton instance
		private static var instance:StuffModelLocator;
		
		//dynamic state
		public var contexts:ArrayCollection;
		public var selectedContext:Context;
		
		public function StuffModelLocator(access:PrivateAccess) {
			if (access == null) {
				throw new CairngormError(CairngormMessageCodes.SINGLETON_EXCEPTION, "StuffModelLocator");
			}
		}

		public static function getInstance():StuffModelLocator {
			if (instance == null) {
				instance = new StuffModelLocator(new PrivateAccess());
			}
			return instance;
		}
		
	}
}

/**
 * Inner class which restricts contructor access to Private
 */
class PrivateAccess {}

