package flexonrails.examples.stuff.control {
	
	import com.adobe.cairngorm.control.FrontController;
	
	import flexonrails.examples.stuff.commands.*;
	import flexonrails.examples.stuff.events.*;
    
	public class StuffController extends FrontController {
		
		public function StuffController() {
			initialize();
		}
		
		private function initialize():void {
			// add commands here
			addCommand(CreateTaskEvent.CreateTask_Event,			CreateTaskCommand);
			addCommand(SelectContextEvent.SelectContext_Event,		SelectContextCommand);
			addCommand(LoadAllContextsEvent.LoadAllContexts_Event,	LoadAllContextsCommand);
			addCommand(LoadAllTasksEvent.LoadAllTasks_Event,		LoadTasksCommand);
			addCommand(SaveContextEvent.SaveContext_Event,			SaveContextCommand);
			addCommand(DeleteContextEvent.DeleteContext_Event,		DeleteContextCommand);
			addCommand(SaveTaskEvent.SaveTask_Event,				SaveTaskCommand);
			addCommand(DeleteTaskEvent.DeleteTask_Event,			DeleteTaskCommand);
		}
	}
}