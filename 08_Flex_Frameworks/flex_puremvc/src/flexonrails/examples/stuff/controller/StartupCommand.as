package flexonrails.examples.stuff.controller {
	
	import flexonrails.examples.stuff.ApplicationFacade;
	import flexonrails.examples.stuff.model.ContextProxy;
	import flexonrails.examples.stuff.view.ContextListMediator;
	import flexonrails.examples.stuff.view.MainViewMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand {
		
		/**
		 * Register the Proxies and Mediators.
		 * 
		 * Get the View Components for the Mediators from the app,
		 * which passed a reference to itself on the notification.
		 */
		override public function execute(note:INotification):void {
			facade.registerProxy(new ContextProxy());
			
			var app:StuffPureMVC = note.getBody() as StuffPureMVC;
			facade.registerMediator(new ContextListMediator(app.contextList));
			facade.registerMediator(new MainViewMediator(app.mainView));
			
			sendNotification(ApplicationFacade.LOAD_CONTEXTS);
		}
	}
}