package {
	
	[Bindable]
	public class AppModel {
		
		private static var instance:AppModel;
		
		public var serviceURL:String;
		
		public static function getInstance():AppModel {
			if (!instance) {
				instance = new AppModel();
			}
			return instance;
		}
		
	}
}