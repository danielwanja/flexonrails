package com.flexonrails.pranaSequences.model {
	
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	import com.adobe.cairngorm.model.IModelLocator;
	import com.flexonrails.pranaSequences.vo.Note;
	import com.flexonrails.pranaSequences.vo.User;
    
    [Bindable]
	public final class ModelLocator {
		
		public static const LOGGED_OUT:int	= 0;
		public static const LOGGED_IN:int	= 1;
		
		// bindable state
		public var appState:int = LOGGED_OUT;
		
		// application state
		public var user:User;
		public var selectedNote:Note;
		
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
