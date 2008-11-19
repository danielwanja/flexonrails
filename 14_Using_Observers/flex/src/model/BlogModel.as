package model {
	
	[Bindable]
	public class BlogModel {
		
		private static var instance:BlogModel;
		
		public var entryHTMLText:String;
		public var entryRawText:String;
		
		public static function getInstance():BlogModel {
			if (!instance) {
				instance = new BlogModel();
			}
			return instance;
		}

	}
}