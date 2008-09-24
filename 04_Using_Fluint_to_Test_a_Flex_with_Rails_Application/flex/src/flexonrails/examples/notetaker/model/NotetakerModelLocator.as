package flexonrails.examples.notetaker.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
   
	[Bindable]
	public class NotetakerModelLocator implements ModelLocator {
		private static var modelLocator : NotetakerModelLocator;
      
    public static function getInstance(forceNewInstance:Boolean=false) : NotetakerModelLocator {
    	if ( modelLocator == null || forceNewInstance) {
    		if (forceNewInstance) modelLocator = null;
      	modelLocator = new NotetakerModelLocator();
      }
			return modelLocator;
		}
      
		public function NotetakerModelLocator() {	
			if ( modelLocator != null ) {
				throw new Error( "Only one NotetakerModelLocator instance should be instantiated" );	
			}
		}
   
		public var notes:XML;
		public var selectedNote:XML;
		
		public var currentView:int = LIST_VIEW;
		
		static public const LIST_VIEW:int = 0;
		static public const EDIT_VIEW:int = 1;
	}
}
