package tests
{
	import net.digitalprimates.fluint.tests.TestCase;
	import net.digitalprimates.fluint.async.TestResponder;
		
	import flash.events.Event;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	
	public class TestNotesResource extends TestCase
	{
		private var notesResource:NotesResource = new NotesResource();

		public function testList():void{
			var call:AsyncToken = notesResource.notes.send();
			var responder:IResponder = asyncResponder( new TestResponder( assertTestList, handleFault ) , 1000, null, handleTimeOut );
			call.addResponder(responder);	
		}
		public function assertTestList(result:ResultEvent, passThroughData:Object):void {
			assertEquals(2, result.result.note.length());
			assertEquals("MyString", result.result.note[0].title);
		}
		protected function handleFault(fault:FaultEvent, passThroughData:Object):void {
		   fail("Failed to invoke notesResource. Received fault from Server "+fault.fault.faultString);
		}				
		protected function handleTimeOut(event:Event):void {
		   fail("Failed to invoke notesResource. Timeout.");
		}		
	}
}