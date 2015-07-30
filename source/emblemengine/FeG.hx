package emblemengine;

import openfl.Assets;

//import emblemengine.core.FeParams;
import emblemengine.map.FeTileReg;

/** FeG Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeG {
//    public static var params(default, null):FeParams;

/*  Initialization
 *  =========================================================================*/
    public static function init():Void {
        FeTileReg.init();
    /*  
        try {
            params = FeParams.parse(Assets.getText("assets/data/params.ini"));
            trace(params);
        }
        catch (err:Dynamic) {
            params = FeParams.parse(FeParams.FALLBACK_PARAMS);
        }
    */
    }
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}