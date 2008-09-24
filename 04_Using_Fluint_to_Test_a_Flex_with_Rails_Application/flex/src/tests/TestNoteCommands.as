package tests
{
  import flash.events.Event;
  
  import flexonrails.examples.notetaker.event.RetrieveNotesEvent;
  import flexonrails.examples.notetaker.event.SaveChangeEvent;
  import flexonrails.examples.notetaker.model.NotetakerModelLocator;
  
  import net.digitalprimates.fluint.sequence.SequenceRunner;
  import net.digitalprimates.fluint.sequence.SequenceBindingWaiter;
  import net.digitalprimates.fluint.tests.TestCase;
  
  import tests.utils.TestHelper;
  
  public class TestNoteCommands extends TestCase
  {
    private var model:NotetakerModelLocator;
    
    override protected function setUp():void {
      TestHelper.resetFixtures(this, ['notes']);
      model = NotetakerModelLocator.getInstance(true);
    }
    public function testRetrieveNotesCommand():void {
      var sequence:SequenceRunner = new SequenceRunner(this);      
      sequence.addStep(new SequenceBindingWaiter(model, "notes", 1000));
      sequence.addAssertHandler(assertRetrieveNotesCommand, null);
      sequence.run();
      new RetrieveNotesEvent().dispatch();
    }
    protected function assertRetrieveNotesCommand(event:Event, passThroughData:Object):void {
      assertNotNull("Expect model.notes not to be null", model.notes);
      assertTrue("Expect more than 0 notes", model.notes.note.length() > 0);      
    }
    public function testSaveChangeCommandNewNote():void {
      var sequence:SequenceRunner = new SequenceRunner(this);      
      sequence.addStep(new SequenceBindingWaiter(model, "selectedNote", 1000));      
      sequence.addStep(new SequenceBindingWaiter(model, "notes", 1000));      
      sequence.addAssertHandler(assertSaveChangeCommandNewNote, null);
      sequence.run();      
      model.selectedNote = <note><body></body></note>;
      new SaveChangeEvent("New Note\rwith lots of info", model.selectedNote).dispatch();
    }
    protected function assertSaveChangeCommandNewNote(event:Event, passThroughData:Object):void {
      assertNotNull("Expect model.notes not to be null", model.notes);
      assertTrue("Expect more than 0 notes", model.notes.note.length() > 0);  
      assertEquals("Expected LIST_VIEW", NotetakerModelLocator.LIST_VIEW, model.currentView);  
      assertEquals("New Note", model.notes.note[model.notes.note.length()-1].title.toString());
      //TODO: test that notes count increment by 1 (requires that we get count or fixtures during setup)
    }
    public function testSaveChangeCommandUpdateNote():void {
      //TODO: test that note changed
    }
    public function testDeleteNoteCommand():void {
      //TODO: test that notes count decrement by 1
    }
    
  }
}