package tests.utils
{
  import flash.events.Event;  
  import mx.rpc.events.ResultEvent;
  import mx.rpc.http.HTTPService;  
  import net.digitalprimates.fluint.tests.TestCase;
  
  public class TestHelper
  {
    static private var fixtures:HTTPService;
    static public function resetFixtures(testCase:TestCase, 
                                         names:Array):void {
      fixtures = new HTTPService();
      fixtures.url = "http://localhost:3000/fixtures/reset";
      fixtures.contentType="application/xml";
      fixtures.addEventListener(ResultEvent.RESULT,  
          testCase.asyncHandler( pendUntilComplete, 1000 ),false, 0, true);
      var data:XML = <fixtures/>
      for each (var fixture:String in names) {
        data.fixture += <fixture>{fixture}</fixture>;
      }
      fixtures.send(data);      
    }
    static public function pendUntilComplete( event:Event, 
                                            passThroughData:Object ):void {
    }
    static public function saveTestResults(results:XML):void {
      fixtures = new HTTPService();
      fixtures.url = "http://localhost:3000/fixtures/test_results";
      fixtures.contentType="application/xml";
      fixtures.method = "POST";
      fixtures.send(results);
    }
  }
}