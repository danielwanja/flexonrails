package events
{
	import flash.events.Event;

	public class SelectStockEvent extends Event
	{
		
		static public const SELECT_STOCK:String = "selectStock";
		public var stock:XML;
		
		public function SelectStockEvent(stock:XML, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(SELECT_STOCK, bubbles, cancelable);
			this.stock = stock;
		}
		
	}
}