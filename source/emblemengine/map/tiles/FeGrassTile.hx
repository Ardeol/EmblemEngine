package emblemengine.map.tiles;

import emblemengine.map.FeTile;
import emblemengine.core.FeAnimations;

/** FeGrassTile Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeGrassTile extends FeTile {
    public static inline var REG_NAME = "grass";

/*  Constructor
 *  =========================================================================*/
    public function new(anims:FeAnimations, data:Dynamic) {
        super(data.tilesheet, anims);
    }
    
/*  Class Methods
 *  =========================================================================*/
    
/*  Tile Properties
 *  =========================================================================*/
    override public function name():String
        return "Field";
 
/*  Public Methods
 *  =========================================================================*/
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}