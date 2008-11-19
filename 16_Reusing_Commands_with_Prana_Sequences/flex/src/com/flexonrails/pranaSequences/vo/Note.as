package com.flexonrails.pranaSequences.vo {
	
	[Bindable]
	[RemoteClass(alias="Note")]
	public class Note {
		
		public var id:Number;
		public var userId:Number;
		public var title:String;
		public var content:String;
		public var createdAt:Date;
		public var updatedAt:Date;

	}
}