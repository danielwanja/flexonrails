package tests
{
	import net.digitalprimates.fluint.tests.TestCase;

	public class TestNoteEditView extends TestCase
	{
		//SETUP: to test UI we need a MainView than contains ListView and EditView. We can then test the main view
		//       or we could just test the EditView and ListView independently...<-- that's what I gonna do.
		public function testDeleteButtonDisabledForAddNote():void {
		  // Issue add note command
		  // Check that delete is disabled	
		}
		
		public function testDeleteButtonEnabledForEditNote():void {
		  // Issue edit note command (needs the list view setup)
		  // Check that delete is disabled				
		}
				
		public function testSaveNoteShowNoteList():void {
		   // 	
		}
		
		public function testChangeNoteTitle():void {
			
		}
	}
}