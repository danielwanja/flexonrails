package tests
{
	import net.digitalprimates.fluint.tests.TestSuite;
	public class NoteTakerTestSuite extends TestSuite
	{
		public function NoteTakerTestSuite()
		{
			addTestCase(new TestNotesResource());
			addTestCase(new TestNoteDelegate());
			addTestCase(new TestNoteCommands());
			addTestCase(new TestNoteListView());
		}	
	}
}