package com.flexonrails.outliner.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexonrails.outliner.business.OutlinePointsDelegate;
	import com.flexonrails.outliner.events.LoadOutlinePointsEvent;
	import com.flexonrails.outliner.model.ModelLocator;
	import com.flexonrails.outliner.vo.OutlinePoint;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadOutlinePointsCommand implements ICommand, IResponder {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LoadOutlinePointsEvent = event as LoadOutlinePointsEvent;
			var delegate:OutlinePointsDelegate = new OutlinePointsDelegate(this);
			delegate.findRootOutlinePoint();
		}

		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var rootPoint:OutlinePoint = result.result as OutlinePoint;
			model.outlinePoints = new ArrayCollection([rootPoint]);
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
			Alert.show(fault.fault.message, "Error Loading Notes");
		}
		
	}
}