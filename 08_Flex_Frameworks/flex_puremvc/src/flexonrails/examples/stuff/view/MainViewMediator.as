package flexonrails.examples.stuff.view {
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import flexonrails.examples.stuff.ApplicationFacade;
	import flexonrails.examples.stuff.model.vo.Context;
	import flexonrails.examples.stuff.model.vo.Task;
	import flexonrails.examples.stuff.view.components.MainView;
	import flexonrails.examples.stuff.view.components.renderers.TaskItemRenderer;
	
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.PropertyChangeEvent;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class MainViewMediator extends Mediator {
		
		public static const NAME:String = 'MainViewMediator';
		
		private var tasksPendingSave:Dictionary;

		public function MainViewMediator(viewComponent:Object) {
			super(NAME, viewComponent);
			
			mainView.addEventListener(MainView.ADD_TASK, addTask);
			mainView.tasksList.addEventListener(TaskItemRenderer.DELETE_TASK, deleteTask);
			tasksPendingSave = new Dictionary(true);
		}
		
		override public function listNotificationInterests():Array {
			return [
				ApplicationFacade.CONTEXT_SELECTED,
				ApplicationFacade.TASKS_LOADED,
				ApplicationFacade.TASK_UPDATED
			];
		}
		
		override public function handleNotification(note:INotification):void {
			switch (note.getName()) {
				case ApplicationFacade.CONTEXT_SELECTED:
					var context:Context = note.getBody() as Context;
					contextSelected(context);
				break;
					
				case ApplicationFacade.TASKS_LOADED:
					listenForChangesToTasks();
				break;
				
				case ApplicationFacade.TASK_UPDATED:
					var task:Task = note.getBody() as Task;
					removeFromTasksPendingSaveRegistery(task);
				break;
				
			}
		}
		
		private function contextSelected(context:Context):void {
			// clean up any old event listeners
			if (mainView.selectedContext && mainView.selectedContext.tasks) {
				mainView.selectedContext.tasks.removeEventListener(CollectionEvent.COLLECTION_CHANGE, taskCollectionChanged);
			}
			mainView.selectedContext = context;
			if (!context.tasksLoaded) {
				sendNotification(ApplicationFacade.LOAD_TASKS, context);
			} else {
				listenForChangesToTasks();
			}
		}
		
		private function listenForChangesToTasks():void {
			// listen for any changes to items in the selected context's task list.
			mainView.selectedContext.tasks.addEventListener(CollectionEvent.COLLECTION_CHANGE, taskCollectionChanged);
		}
		
		private function taskCollectionChanged(ce:CollectionEvent):void {
			var task:Task;
			switch(ce.kind) {
				
				case CollectionEventKind.ADD :
					var index:int = ce.location;
					mainView.tasksList.selectedIndex = index;
				break;
				
				case CollectionEventKind.UPDATE :
					for each (var pce:PropertyChangeEvent in ce.items) {
						task = pce.source as Task;
						if (userEditablePropertyChange(pce) && !taskIsPendingSave(task)) { //ignore updates for tasks that we're saving
							task.newTask = false;
							addToTasksPendingSaveRegistery(task);
							sendNotification(ApplicationFacade.SAVE_TASK, task);
						}
					}
				break;
				
				case CollectionEventKind.REMOVE :
					for each (task in ce.items) {
						sendNotification(ApplicationFacade.DELETE_TASK, task); 
					}
				break;
			}
		}
		
		private function addTask(e:Event):void {
			sendNotification(ApplicationFacade.ADD_TASK, mainView.selectedContext);
		}
		
		private function deleteTask(e:Event):void {
			var renderer:TaskItemRenderer = e.target as TaskItemRenderer;
			var task:Task = renderer.task;
			var index:int = mainView.selectedContext.tasks.getItemIndex(task);
			mainView.selectedContext.tasks.removeItemAt(index);
		}
		
		private function addToTasksPendingSaveRegistery(task:Task):void {
			tasksPendingSave[task.id] = task;
		}
		
		private function removeFromTasksPendingSaveRegistery(task:Task):void {
			tasksPendingSave[task.id] = null;
			delete tasksPendingSave[task.id];
		}
		
		private function taskIsPendingSave(task:Task):Boolean {
			return (tasksPendingSave[task.id] != null)
		}
		
		private function userEditablePropertyChange(pce:PropertyChangeEvent):Boolean {
			var property:String = pce.property as String;
			if (property == 'id' || property == 'newTask' || property == 'createdAt' || property == 'updatedAt') {
				return false
			}
			return true;
		}
		
		private function get mainView():MainView {
			return viewComponent as MainView;
		}
		
	}
}