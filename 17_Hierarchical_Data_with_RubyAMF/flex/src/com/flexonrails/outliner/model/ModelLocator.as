package com.flexonrails.outliner.model {
	
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	
	import mx.collections.ArrayCollection;
    
    [Bindable]
	public final class ModelLocator {
		
		public var outlinePoints:ArrayCollection;
		
		private static var instance:ModelLocator;
		
		public function ModelLocator(access:Private) {
			if (access == null) {
			    throw new CairngormError( CairngormMessageCodes.SINGLETON_EXCEPTION, "ModelLocator" );
			}
			instance = this;
		}
		 
		public static function getInstance():ModelLocator {
			if (instance == null) {
				instance = new ModelLocator(new Private());
			}
			return instance;
		}
	}
}

/**
 * Inner class which restricts constructor access to Private
 */
class Private {}
