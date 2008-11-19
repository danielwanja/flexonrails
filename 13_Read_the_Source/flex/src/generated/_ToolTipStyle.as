
package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.ToolTipBorder;

[ExcludeClass]

public class _ToolTipStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("ToolTip");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ToolTip", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.paddingTop = 2;
                this.borderColor = 0x919999;
                this.paddingLeft = 4;
                this.cornerRadius = 2;
                this.paddingRight = 4;
                this.shadowColor = 0x000000;
                this.fontSize = 9;
                this.borderSkin = mx.skins.halo.ToolTipBorder;
                this.backgroundAlpha = 0.95;
                this.paddingBottom = 2;
                this.borderStyle = "toolTip";
                this.backgroundColor = 0xffffcc;
            };
        }
    }
}

}
