/**
	Created with ar2as on: Wed Jan 09 21:53:23 -0700 2008
	Created from Schema Version: 2
*/
package flexonrails.examples.stuff.vo {
	
	[Bindable]
	[RemoteClass(alias="Task")]
	public class Task {
		
		// attributes
		public var id:int;
		public var contextId:int;
		public var label:String;
		public var completedAt:Date;
		public var createdAt:Date;
		public var updatedAt:Date;
		
		[Transient]
		public var newTask:Boolean;
		
	}

}
