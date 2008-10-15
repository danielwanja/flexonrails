/**
	Created with ar2as on: Wed Jan 09 21:53:23 -0700 2008
	Created from Schema Version: 2
*/
package flexonrails.examples.stuff.model.vo {
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="Context")]
	public class Context {
		
		// attributes
		public var id:int;
		public var label:String;
		public var createdAt:Date;
		public var updatedAt:Date;
		
		[Transient]
		public var tasksLoaded:Boolean;
		
		[Transient]
		public var tasks:ArrayCollection;
		
	}

}
