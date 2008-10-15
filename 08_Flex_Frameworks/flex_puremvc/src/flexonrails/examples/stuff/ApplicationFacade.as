package flexonrails.examples.stuff {

	import flexonrails.examples.stuff.controller.*;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade {
		
		// Notification name constants
		public static const STARTUP:String 			= "startup";
		
		public static const LOAD_CONTEXTS:String	= "loadContexts";
		public static const CONTEXTS_LOADED:String	= "contextsLoaded";
		
		public static const SAVE_CONTEXT:String 	= "saveContext";
		public static const CONTEXT_ADDED:String	= "contextAdded";
		public static const CONTEXT_UPDATED:String	= "contextUpdated";
		
		public static const DELETE_CONTEXT:String 	= "deleteContext";
		public static const CONTEXT_DELETED:String	= "contextDeleted";
		
		public static const CONTEXT_SELECTED:String	= "contextSelected";
		
		public static const LOAD_TASKS:String 		= "loadTasks";
		public static const TASKS_LOADED:String		= "tasksLoaded";

		public static const ADD_TASK:String 		= "addTask";
		public static const SAVE_TASK:String 		= "updateTask";
		public static const TASK_UPDATED:String		= "taskUpdated";

		public static const DELETE_TASK:String 		= "deleteTask";
		public static const TASK_DELETED:String		= "taskDeleted";
		
		public function ApplicationFacade(access:PrivateAccess) {
			super();
			if (!access) {
				throw new Error("ApplicationFacade must be accessed from getInstance");
			}
		}
		
		public static function getInstance():ApplicationFacade {
			if (instance == null) {
				instance = new ApplicationFacade(new PrivateAccess());
			}
			return instance as ApplicationFacade;
		}

		/**
		 * Called by framwork to register commands with the controller 
		 */
		override protected function initializeController():void {
			super.initializeController();			
			registerCommand(STARTUP,		StartupCommand);
			registerCommand(LOAD_CONTEXTS,	LoadAllContextsCommand);
			registerCommand(DELETE_CONTEXT,	DeleteContextCommand);
			registerCommand(SAVE_CONTEXT,	SaveContextCommand);
			registerCommand(LOAD_TASKS,		LoadTasksCommand);
			registerCommand(ADD_TASK,		CreateTaskCommand);
			registerCommand(SAVE_TASK,		SaveTaskCommand);
			registerCommand(DELETE_TASK,	DeleteTaskCommand);
		}
		
	}
}

/**
 * Inner class which restricts contructor access to Private
 */
class PrivateAccess {}

