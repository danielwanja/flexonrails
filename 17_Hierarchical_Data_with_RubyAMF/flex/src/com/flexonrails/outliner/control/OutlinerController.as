package com.flexonrails.outliner.control {
	
	import com.adobe.cairngorm.control.FrontController;
	import com.flexonrails.outliner.commands.*;
	import com.flexonrails.outliner.events.*;
    
	public final class OutlinerController extends FrontController {

		public function OutlinerController() {
			this.initialize();
		}
		
		private function initialize():void {
			// add commands
			addCommand(LoadOutlinePointsEvent.LoadOutlinePoints_Event,	LoadOutlinePointsCommand)
		}
	}
}
