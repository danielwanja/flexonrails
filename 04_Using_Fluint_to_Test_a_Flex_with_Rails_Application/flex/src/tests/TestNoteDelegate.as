package tests
{
  import flash.events.Event;
  
  import flexonrails.examples.notetaker.business.NoteDelegate;
  
  import mx.rpc.IResponder;
  import mx.rpc.events.ResultEvent;
  import mx.rpc.http.HTTPService;
  
  import net.digitalprimates.fluint.async.TestResponder;
  import net.digitalprimates.fluint.tests.TestCase;
  
  import tests.utils.TestHelper;
  public class TestNoteDelegate extends TestCase
  {
    private var delegate:NoteDelegate;
    private var fixtures:HTTPService;
    
    override protected function setUp():void {
      TestHelper.resetFixtures(this, ['notes']);
    }
    public function testList():void {
            var responder:IResponder = asyncResponder( new TestResponder( assertTestList, assertTestList ) , 1000 );
                var delegate : NoteDelegate = new NoteDelegate( responder );
                delegate.list();   
        }
        public function assertTestList(result:Event, token:Object = null):void {
          assertTrue(result is ResultEvent);
          assertEquals(2, (result as ResultEvent).result.note.length());
          assertEquals("MyString", (result as ResultEvent).result.note[0].title);
        }     
        
        public function testCreate():void{      
            var responder:IResponder = asyncResponder( new TestResponder( assertTestCreate, assertTestCreate ) , 1000 );
                var delegate : NoteDelegate = new NoteDelegate( responder );
          delegate.create(<note>
                      <title>My First Note</title>
                      <body>Is this a hello world? Not even funny.</body>
                  </note>);
        }
        public function assertTestCreate(result:ResultEvent, token:Object = null):void {
          assertEquals("My First Note", result.result.title);
        }
          
          
        public function testUpdate():void {
            var note:XML = 
                <note>
                  <id>1</id>
                  <body>Testing Updates</body>
                </note>;   
            var passThroughData:Object = {noteId:Number(note.id)}        
            var responder:IResponder = asyncResponder( 
                  new TestResponder( assertTestUpdateSuccess, 
                                     assertTestUpdateSuccess ), 
                  1000, passThroughData );
            var delegate:NoteDelegate = new NoteDelegate( responder );
            delegate.update(note)
        }
        
        public function assertTestUpdateSuccess(result:Object, token:Object = null):void {
            assertTrue(result is ResultEvent);
            var responder:IResponder = asyncResponder( 
                  new TestResponder( assertTestUpdateData, 
                                     assertTestUpdateData ), 
                  1000 );
                  var delegate:NoteDelegate = new NoteDelegate( responder );
            delegate.show(token.noteId);      
        }
        public function assertTestUpdateData(result:Object, token:Object = null):void {
          assertTrue(result is ResultEvent);
          assertEquals("Testing Updates", result.result.body);
        }   
    
    public function testDelete():void {
        var responder:IResponder = asyncResponder( new TestResponder( assertTestDelete, assertTestDelete ) , 1000 );
            var delegate : NoteDelegate = new NoteDelegate( responder );
      delegate.destroy(1);
    }
    public function assertTestDelete(result:Object, token:Object = null):void {
      assertTrue(result is ResultEvent);
    }
    
      
    
  }
}