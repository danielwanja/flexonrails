package @namespace@.@model@ {
	
	import com.adobe.cairngorm.model.IModelLocator;
	import com.adobe.cairngorm.CairngormError;
    import com.adobe.cairngorm.CairngormMessageCodes;
    
    [Bindable]
	public class @projectname@ModelLocator implements IModelLocator {
		
		/**
		 * Singleton instance of @projectname@ModelLocator
		 */
		private static var instance:@projectname@ModelLocator;

		public function @projectname@ModelLocator(access:Private) {
			if (access != null) {
				if (instance == null) {
					instance = this;
				}
			}
			else {
				throw new CairngormError(CairngormMessageCodes.SINGLETON_EXCEPTION, "@projectname@ModelLocator");
			}
		}
		 
		/**
		 * Returns the Singleton instance of @projectname@ModelLocator
		 */
		public static function getInstance():@projectname@ModelLocator {
			if (instance == null) {
				instance = new @projectname@ModelLocator(new Private());
			}
			return instance;
		}
	}
}

/**
 * Inner class which restricts constructor access to Private
 */
class Private {}

