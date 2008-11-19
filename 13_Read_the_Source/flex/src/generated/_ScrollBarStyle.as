
package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.ScrollArrowSkin;
import mx.skins.halo.ScrollTrackSkin;
import mx.skins.halo.ScrollThumbSkin;

[ExcludeClass]

public class _ScrollBarStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("ScrollBar");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("ScrollBar", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.trackColors = [0x94999b, 0xe7e7e7];
                this.thumbOffset = 0;
                this.paddingTop = 0;
                this.downArrowSkin = mx.skins.halo.ScrollArrowSkin;
                this.borderColor = 0xb7babc;
                this.paddingLeft = 0;
                this.cornerRadius = 4;
                this.paddingRight = 0;
                this.trackSkin = mx.skins.halo.ScrollTrackSkin;
                this.thumbSkin = mx.skins.halo.ScrollThumbSkin;
                this.paddingBottom = 0;
                this.upArrowSkin = mx.skins.halo.ScrollArrowSkin;
            };
        }
    }
}

}
