package com.flexonrails.pranaSequences.commands {
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.flexonrails.pranaSequences.business.NotesDelegate;
	import com.flexonrails.pranaSequences.events.LoadUserNotesEvent;
	import com.flexonrails.pranaSequences.model.ModelLocator;
	import com.flexonrails.pranaSequences.vo.User;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoadUserNotesCommand implements ICommand, IResponder {
		
		private var model:ModelLocator = ModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void {
			var evt:LoadUserNotesEvent = event as LoadUserNotesEvent;
			var delegate:NotesDelegate = new NotesDelegate(this);
			delegate.findAllForCurrentUser();
		}

		public function result(data:Object):void {
			var result:ResultEvent = data as ResultEvent;
			var notes:ArrayCollection = result.result as ArrayCollection;
			model.user.notes = notes;
		}
		
		public function fault(info:Object):void {
			var fault:FaultEvent = info as FaultEvent;
			Alert.show(fault.fault.message, "Error Loading Notes");
		}
		
	}
}