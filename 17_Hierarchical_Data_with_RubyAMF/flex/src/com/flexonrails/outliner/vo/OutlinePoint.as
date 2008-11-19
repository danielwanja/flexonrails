package com.flexonrails.outliner.vo {
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="OutlinePoint")]
	public class OutlinePoint {
		
		public var id:Number;
		public var label:String;
		public var parent:OutlinePoint;
		public var createdAt:Date;
		public var updatedAt:Date;
		
		public var children:ArrayCollection;
		
	}
}