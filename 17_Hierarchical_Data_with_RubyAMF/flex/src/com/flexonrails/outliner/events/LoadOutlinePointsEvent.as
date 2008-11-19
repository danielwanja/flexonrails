package com.flexonrails.outliner.events {
	
	import com.adobe.cairngorm.control.CairngormEvent;

	public class LoadOutlinePointsEvent extends CairngormEvent {
		
		public static const LoadOutlinePoints_Event:String = "<LoadOutlinePointsEvent>";
		
		public function LoadOutlinePointsEvent() {
			super(LoadOutlinePoints_Event);
		}
	}
}