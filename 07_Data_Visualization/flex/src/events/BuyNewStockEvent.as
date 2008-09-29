package events
{
	import flash.events.Event;

	public class BuyNewStockEvent extends Event
	{
		static public const BUY:String = "buyStock";
		static public const SELL:String = "sellStock";
		
		public var ticker:String;
		public var quantity:Number;
		
		public function BuyNewStockEvent(ticker:String, quantity:Number, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.ticker = ticker;
			this.quantity = quantity;
		}
		
	}
}