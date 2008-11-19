package com.flexonrails.pranaSequences.vo {
	import mx.collections.ArrayCollection;
	
	
	[Bindable]
	[RemoteClass(alias="User")]
	public class User {
		
		public var id:Number;
		public var login:String;
		public var email:String;
		public var createdAt:Date;
		public var updatedAt:Date;
		
		[Transient]
		public var notes:ArrayCollection;

	}
}