package flexonrails.examples.vo {
	
	[RemoteClass(alias="Contact")]
	[Bindable]
	public class Contact {
		
		public var id:int;
		public var firstName:String;
		public var lastName:String;
		public var email:String;
		public var homePhone:String;
		public var officePhone:String;
		public var createdAt:Date;
		public var updateAt:Date;
		
		[Transient]
		public var newContact:Boolean = true;
		
	}
}