package flexonrails.examples.notetaker.business
{
  import com.adobe.cairngorm.business.ServiceLocator;  
  import mx.rpc.AsyncToken;
  import mx.rpc.IResponder;
  
  public class NoteDelegate
  {
    private var responder : IResponder;
    private var notesService: Object;
    private var noteCreateService: Object;
    private var noteShowService: Object;
    private var noteDeleteService: Object;
    private var noteUpdateService: Object;
    
    public function NoteDelegate(responder : IResponder)
    {
      this.notesService      = getService( "notes" );
      this.noteCreateService = getService( "noteCreate" );
      this.noteShowService   = getService( "noteShow" );
      this.noteDeleteService = getService( "noteDelete" );
      this.noteUpdateService = getService( "noteUpdate" );
      this.responder = responder;
    }

    private function getService(name:String):Object {
      return ServiceLocator.getInstance().getHTTPService(name);
    }
    
    public function list():void {
      var call:AsyncToken = this.notesService.send();
      call.addResponder(this.responder);      
    }
    public function create(note:XML):void {
      var call:AsyncToken = this.noteCreateService.send(note);
      call.addResponder(this.responder);
    }
    public function show(id:Number):void {
      this.noteShowService.url = "http://localhost:3000/notes/"+id+".xml";
      var call:AsyncToken = this.noteShowService.send();
      call.addResponder(this.responder);      
    }
    public function update(note:XML):void {
      this.noteUpdateService.url = "http://localhost:3000/notes/"+note.id.toString()+".xml?_method=put"
      var call:AsyncToken = this.noteUpdateService.send(note);
      call.addResponder(this.responder);      
    }
    public function destroy(id:Number):void {
      this.noteDeleteService.url = "http://localhost:3000/notes/"+id+".xml"
      var call:AsyncToken = this.noteDeleteService.send();
      call.addResponder(this.responder);      
    }
  
  }
}