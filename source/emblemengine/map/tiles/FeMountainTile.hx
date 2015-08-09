package emblemengine.map.tiles;

import emblemengine.FeC;
import emblemengine.map.FeTile;
import emblemengine.core.FeAnimations;
import emblemengine.unit.FeUnitType;

/** FeThicketTile Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeMountainTile extends FeTile {
    public static inline var REG_NAME = "mountain";

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
        return "Mountain";
        
    override public function def(?type:FeUnitType):Int
        return 2;
    
    override public function avoid(?type:FeUnitType):Int
        return 40;
    
    override public function hit(?type:FeUnitType):Int
        return 10;
    
    override public function moveCost(type:FeUnitType):Float {
        return switch(type) {
            case FeUnitType.INFANTRY:       12.0;
            case FeUnitType.LIGHT_INFANTRY: 12.0;
            case FeUnitType.ARMORED:        FeC.NON_TRAVERSABLE;
            case FeUnitType.MOUNTED:        FeC.NON_TRAVERSABLE;
            case FeUnitType.FLYING:         2.0;
            default: super.moveCost(type);
        }
    }
 
/*  Public Methods
 *  =========================================================================*/
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}