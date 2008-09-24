package tests
{
  import flash.events.Event;
  import flash.events.MouseEvent;
  import mx.events.FlexEvent; 
  import flexonrails.examples.notetaker.event.RetrieveNotesEvent;
  import flexonrails.examples.notetaker.model.NotetakerModelLocator;
  import flexonrails.examples.notetaker.view.ListView;  
  import tests.utils.TestHelper;
  import net.digitalprimates.fluint.sequence.SequenceEventDispatcher;
  import net.digitalprimates.fluint.sequence.SequenceRunner;
  import net.digitalprimates.fluint.sequence.SequenceSetter;
  import net.digitalprimates.fluint.sequence.SequenceWaiter;
  import net.digitalprimates.fluint.sequence.SequenceBindingWaiter;
  import net.digitalprimates.fluint.tests.TestCase;
  
  
  public class TestNoteListView extends TestCase
  {
    private var model:NotetakerModelLocator;
    private var listView:ListView;
    
    override protected function setUp():void {
      TestHelper.resetFixtures(this, ['notes']);
      model = NotetakerModelLocator.getInstance(true);
      listView = new ListView();
      listView.addEventListener(FlexEvent.CREATION_COMPLETE, 
                asyncHandler( pendUntilComplete, 1000 ), false, 0, true );
      addChild(listView);
    }
    override protected function tearDown():void {
      model = null;
      removeChild(listView);
      listView = null; 
    }
        
    public function testAddNewNote():void {
      var sequence:SequenceRunner = new SequenceRunner(this);
      sequence.addStep( 
          new SequenceEventDispatcher( 
              listView.addBtn, new MouseEvent( 'click', true, false ) ) );
      sequence.addStep(
          new SequenceBindingWaiter(model, "selectedNote",1000));
      sequence.addStep(
          new SequenceBindingWaiter(model, "currentView",1000));
      sequence.addAssertHandler(assertAddNewNote, null);
      sequence.run();
    }
    protected function assertAddNewNote(event:Event, 
                                        passThroughData:Object):void {
      assertEquals("Expected EDIT_VIEW", 
                   NotetakerModelLocator.EDIT_VIEW, model.currentView);
    }      
      
    public function testClickNoteListShowsEditNote():void {
      var sequence:SequenceRunner = new SequenceRunner(this);
      sequence.addStep(new SequenceBindingWaiter(model, "notes", 1000));
      sequence.addStep(new SequenceSetter(
                                listView.list,{selectedIndex: 1})); 
      sequence.addStep(new SequenceEventDispatcher(
                  listView.list, new MouseEvent( 'click', true, false)));
      sequence.addStep(new SequenceWaiter(
                  listView.list, MouseEvent.CLICK, 100));  
      sequence.addAssertHandler(assertClickNoteListShowsEditNote, null);
      sequence.run();      
      new RetrieveNotesEvent().dispatch();
    }
    protected function assertClickNoteListShowsEditNote(event:Event, 
                                          passThroughData:Object):void {
      assertEquals("Expected EDIT_VIEW", 
                   NotetakerModelLocator.EDIT_VIEW, model.currentView);  
      assertEquals("MyString", model.selectedNote.title);
    }    
  }
}