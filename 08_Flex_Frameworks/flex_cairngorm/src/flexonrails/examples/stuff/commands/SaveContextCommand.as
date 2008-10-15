package flexonrails.examples.stuff.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flexonrails.examples.stuff.business.ContextsDelegate;
	import flexonrails.examples.stuff.events.SaveContextEvent;
	import flexonrails.examples.stuff.model.StuffModelLocator;
	import flexonrails.examples.stuff.vo.Context;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class SaveContextCommand implements ICommand, IResponder {
		
		private var model:StuffModelLocator = StuffModelLocator.getInstance();
		private var wasNew:Boolean;
		
		public function execute(event:CairngormEvent):void {
			var evt:SaveContextEvent = event as SaveContextEvent;
			var delegate:ContextsDelegate = new ContextsDelegate(this);
			delegate.save(evt.context);
			if (evt.context.id == 0) {
				wasNew = true;
			}
		}
		
		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var context:Context = result.result as Context;
			if (wasNew) {
				model.contexts.addItem(context);
			}
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
		}
	}
}