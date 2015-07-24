package emblemengine.map.tiles;

import emblemengine.map.FeTile;

/** FeFloorTile Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeFloorTile extends FeTile {
    public static inline var REG_NAME = "floor";

/*  Constructor
 *  =========================================================================*/
    public function new(data:Dynamic) {
        super();
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