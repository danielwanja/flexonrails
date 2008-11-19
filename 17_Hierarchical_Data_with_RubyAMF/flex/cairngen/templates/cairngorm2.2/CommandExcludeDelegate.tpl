package @namespace@.@commands@ {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import @namespace@.@events@.@sequence@Event;
	import @namespace@.model.ModelLocator;

	public class @sequence@Command implements ICommand {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:@sequence@Event = event as @sequence@Event;
		}
		
	}
}