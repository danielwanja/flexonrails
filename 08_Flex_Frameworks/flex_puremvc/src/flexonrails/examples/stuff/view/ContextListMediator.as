package flexonrails.examples.stuff.view {
	
	import flash.events.Event;
	
	import flexonrails.examples.stuff.ApplicationFacade;
	import flexonrails.examples.stuff.model.ContextProxy;
	import flexonrails.examples.stuff.model.vo.Context;
	import flexonrails.examples.stuff.view.components.ContextList;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ContextListMediator extends Mediator {
		
		private var contextProxy:ContextProxy;

		public static const NAME:String = 'ContextListMediator';

		public function ContextListMediator(viewComponent:Object) {
			super(NAME, viewComponent);
			
			contextList.addEventListener(ContextList.NEW, newContext);
			contextList.addEventListener(ContextList.DELETE, deleteSelectedContext);
			contextList.addEventListener(ContextList.SELECT, contextSelected);

			contextProxy = facade.retrieveProxy(ContextProxy.NAME) as ContextProxy;
			contextList.contexts = contextProxy.contexts;
		}
		
		private function get contextList():ContextList {
			return viewComponent as ContextList;
		}
		
		private function newContext(event:Event):void {
			var context:Context = new Context();
			context.label = contextList.newContextLabel.text;
			sendNotification(ApplicationFacade.SAVE_CONTEXT, context);
		}
		
		private function updateContext(event:Event):void {
			contextList.selectedContext.label = contextList.newContextLabel.text;
			sendNotification(ApplicationFacade.SAVE_CONTEXT, contextList.selectedContext);
		}
		
		private function deleteSelectedContext(event:Event):void {
			sendNotification(ApplicationFacade.DELETE_CONTEXT, contextList.selectedContext);
			sendNotification(ApplicationFacade.CONTEXT_SELECTED);
		}
		
		private function contextSelected(event:Event):void {
			sendNotification(ApplicationFacade.CONTEXT_SELECTED, contextList.selectedContext);
		}

		override public function listNotificationInterests():Array {
			return [ApplicationFacade.CONTEXTS_LOADED];
		}
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				case ApplicationFacade.CONTEXTS_LOADED:
					if (contextProxy.contexts.length > 0) {
						contextList.contextList.selectedIndex = 0;
						contextSelected(null);
					}
				break;
					
			}
		}
		
	}
}