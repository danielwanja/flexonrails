package @namespace@.@control@ {
	
	import com.adobe.cairngorm.control.FrontController;
    import @namespace@.@commands@.*;
    import @namespace@.@events@.*;
    
	public class @projectname@Controller extends FrontController {
		
		public function @projectname@Controller() {
			this.initialize();
		}
		
		private function initialize() : void {
			//this.addCommand();
		}
	}
}