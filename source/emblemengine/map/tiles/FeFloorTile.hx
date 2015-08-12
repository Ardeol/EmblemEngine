package emblemengine.map.tiles;

import emblemengine.map.FeTile;
import emblemengine.core.FeAnimations;
import emblemengine.unit.FeUnitType;

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
    
/*  Tile Properties
 *  =========================================================================*/
    override public function name():String
        return "Floor";
    
    override public function moveCost(type:FeUnitType):Float {
        return switch(type) {
            case FeUnitType.INFANTRY:       1.0;
            case FeUnitType.LIGHT_INFANTRY: 1.0;
            case FeUnitType.ARMORED:        1.0;
            case FeUnitType.CALVARY:        1.28;
            case FeUnitType.PEGASUS:        1.5;
            case FeUnitType.DRAGON:         1.5;
            default: super.moveCost(type);
        }
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