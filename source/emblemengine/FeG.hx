package emblemengine;

import openfl.Assets;

import emblemengine.FeC;
import emblemengine.core.FeParams;
import emblemengine.core.FeKeybinds;
import emblemengine.map.FeTileReg;

/** FeG Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeG {
    public static var params(default, null):FeParams;
    public static var key(default, null):FeKeybinds;

/*  Initialization
 *  =========================================================================*/
    public static function init():Void {
        FeTileReg.init();
        params = new FeParams();
        try {
            params.parse(Assets.getText(FeC.PATH_PARAMS));
        }
        catch (err:Dynamic) {
            params.parse(FeParams.FALLBACK_PARAMS);
            saveParams();
        }
        key = new FeKeybinds(params);
    }
    
/*  Class Methods
 *  =========================================================================*/
    public static function notImplemented(cls:String, method:String, ?msg:String = ""):Void {
        trace('$method in $cls not implemented: $msg');
    }
 
    public static function saveParams():Void {
        notImplemented("FeG", "saveParams", "platform dependent");
    }
 
/*  Public Methods
 *  =========================================================================*/
    
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}