package tests.utils
{
	import net.digitalprimates.fluint.sequence.SequenceWaiter;
	import flash.events.IEventDispatcher;
	import mx.events.PropertyChangeEvent;
	import net.digitalprimates.fluint.sequence.SequenceRunner;
	import net.digitalprimates.fluint.tests.TestCase;

	/**
	 * This class only triggers the asyncHandler (realHandler) when the property change event for the
	 * given property is trigger. 
	 */
	public class SequencePropertyChangeWaiter extends SequenceWaiter
	{
		private var property:String 
		private var realHandler:Function;
		
		public function SequencePropertyChangeWaiter(target:IEventDispatcher, property:String, timeout:int, timeoutHandler:Function=null)
		{
			super(target, PropertyChangeEvent.PROPERTY_CHANGE, timeout, timeoutHandler);
			this.property = property;
		}
		
		override public function setupListeners( testCase:TestCase, sequence:SequenceRunner ):void {
			realHandler =  testCase.asyncHandler( testCase.handleNextSequence, timeout, sequence, timeoutHandler );
			target.addEventListener( eventName, propertyChanged, false, 0, true );
		}
		
		private function propertyChanged(event:PropertyChangeEvent):void {
			if (event.property == property)
			   realHandler(event); 
		}
		
	}
}