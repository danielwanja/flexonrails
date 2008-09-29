package events
{
	import flash.events.Event;

	public class UpdateStockEvent extends Event
	{
		static public const BUY:String = "buyStock";
		static public const SELL:String = "sellStock";
		
		public var stock:XML;
		public var quantity:Number;
		
		public function UpdateStockEvent(type:String, stock:XML, quantity:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.stock = stock;
			this.quantity = quantity;
		}
		
	}
}