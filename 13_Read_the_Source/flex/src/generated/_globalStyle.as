
package 
{

import flash.display.Sprite;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.skins.halo.HaloFocusRect;
import mx.skins.halo.HaloBorder;

[ExcludeClass]

public class _globalStyle
{

    public static function init(fbs:IFlexModuleFactory):void
    {
        var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("global");
    
        if (!style)
        {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("global", style, false);
        }
    
        if (style.defaultFactory == null)
        {
            style.defaultFactory = function():void
            {
                this.fontWeight = "normal";
                this.modalTransparencyBlur = 3;
                this.verticalGridLineColor = 0xd5dddd;
                this.borderStyle = "inset";
                this.buttonColor = 0x6f7777;
                this.borderCapColor = 0x919999;
                this.textAlign = "left";
                this.disabledIconColor = 0x999999;
                this.stroked = false;
                this.fillColors = [0xffffff, 0xcccccc, 0xffffff, 0xeeeeee];
                this.fontStyle = "normal";
                this.borderSides = "left top right bottom";
                this.borderThickness = 1;
                this.modalTransparencyDuration = 100;
                this.useRollOver = true;
                this.strokeWidth = 1;
                this.filled = true;
                this.borderColor = 0xb7babc;
                this.horizontalGridLines = false;
                this.horizontalGridLineColor = 0xf7f7f7;
                this.shadowCapColor = 0xd5dddd;
                this.fontGridFitType = "pixel";
                this.horizontalAlign = "left";
                this.modalTransparencyColor = 0xdddddd;
                this.disabledColor = 0xaab3b3;
                this.borderSkin = mx.skins.halo.HaloBorder;
                this.dropShadowColor = 0x000000;
                this.paddingBottom = 0;
                this.indentation = 17;
                this.version = "3.0.0";
                this.fontThickness = 0;
                this.verticalGridLines = true;
                this.embedFonts = false;
                this.fontSharpness = 0;
                this.shadowDirection = "center";
                this.textDecoration = "none";
                this.selectionDuration = 250;
                this.bevel = true;
                this.fillColor = 0xffffff;
                this.focusBlendMode = "normal";
                this.dropShadowEnabled = false;
                this.textRollOverColor = 0x2b333c;
                this.textIndent = 0;
                this.fontSize = 10;
                this.openDuration = 250;
                this.closeDuration = 250;
                this.kerning = false;
                this.paddingTop = 0;
                this.highlightAlphas = [0.3, 0];
                this.cornerRadius = 0;
                this.horizontalGap = 8;
                this.textSelectedColor = 0x2b333c;
                this.paddingLeft = 0;
                this.modalTransparency = 0.5;
                this.roundedBottomCorners = true;
                this.repeatDelay = 500;
                this.selectionDisabledColor = 0xdddddd;
                this.fontAntiAliasType = "advanced";
                this.focusSkin = mx.skins.halo.HaloFocusRect;
                this.verticalGap = 6;
                this.leading = 2;
                this.shadowColor = 0xeeeeee;
                this.backgroundAlpha = 1.0;
                this.iconColor = 0x111111;
                this.focusAlpha = 0.4;
                this.borderAlpha = 1.0;
                this.focusThickness = 2;
                this.themeColor = 0x009dff;
                this.backgroundSize = "auto";
                this.indicatorGap = 14;
                this.letterSpacing = 0;
                this.fontFamily = "Verdana";
                this.fillAlphas = [0.6, 0.4, 0.75, 0.65];
                this.color = 0x0b333c;
                this.paddingRight = 0;
                this.errorColor = 0xff0000;
                this.verticalAlign = "top";
                this.focusRoundedCorners = "tl tr bl br";
                this.shadowDistance = 2;
                this.repeatInterval = 35;
            };
        }
    }
}

}
