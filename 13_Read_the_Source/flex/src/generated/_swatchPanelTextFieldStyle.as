
package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;

[ExcludeClass]

public class _swatchPanelTextFieldStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration(".swatchPanelTextField");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration(".swatchPanelTextField", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.highlightColor = 0xc4cccc;
                this.borderColor = 0xd5dddd;
                this.paddingLeft = 5;
                this.shadowCapColor = 0xd5dddd;
                this.paddingRight = 5;
                this.shadowColor = 0xd5dddd;
                this.borderStyle = "inset";
                this.buttonColor = 0x6f7777;
                this.backgroundColor = 0xffffff;
                this.borderCapColor = 0x919999;
            };
        }
    }
}

}
