

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import String;
import mx.controls.Text;

class BindableProperty
{
	/**
	 * generated bindable wrapper for property helloWorldText (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'helloWorldText' moved to '_1854959827helloWorldText'
	 */

    [Bindable(event="propertyChange")]
    public function get helloWorldText():mx.controls.Text
    {
        return this._1854959827helloWorldText;
    }

    public function set helloWorldText(value:mx.controls.Text):void
    {
    	var oldValue:Object = this._1854959827helloWorldText;
        if (oldValue !== value)
        {
            this._1854959827helloWorldText = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "helloWorldText", oldValue, value));
        }
    }

	/**
	 * generated bindable wrapper for property theText (private)
	 * - generated setter
	 * - generated getter
	 * - original private var 'theText' moved to '_1350444738theText'
	 */

    [Bindable(event="propertyChange")]
    private function get theText():String
    {
        return this._1350444738theText;
    }

    private function set theText(value:String):void
    {
    	var oldValue:Object = this._1350444738theText;
        if (oldValue !== value)
        {
            this._1350444738theText = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "theText", oldValue, value));
        }
    }



}
