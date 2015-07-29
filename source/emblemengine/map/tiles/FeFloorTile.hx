package emblemengine.map.tiles;

import emblemengine.map.FeTile;
import emblemengine.core.FeAnimations;

/** FeFloorTile Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeFloorTile extends FeTile {
    public static inline var REG_NAME = "floor";

/*  Constructor
 *  =========================================================================*/
    public function new(anims:FeAnimations, data:Dynamic) {
        super(data.tilesheet, anims);
    }
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    override public function toString():String {
        return "Floor";
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}