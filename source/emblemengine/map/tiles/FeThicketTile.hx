package emblemengine.map.tiles;

import emblemengine.map.FeTile;
import emblemengine.core.FeAnimations;
import emblemengine.unit.FeUnitType;

/** FeThicketTile Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeThicketTile extends FeTile {
    public static inline var REG_NAME = "thicket";

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
        return "Thicket";
        
    override public function def(?type:FeUnitType):Int
        return 1;
    
    override public function avoid(?type:FeUnitType):Int
        return 10;
    
    override public function hit(?type:FeUnitType):Int
        return -5;
    
    override public function moveCost(type:FeUnitType):Float {
        return switch(type) {
            case FeUnitType.INFANTRY:       3.0;
            case FeUnitType.LIGHT_INFANTRY: 3.0;
            case FeUnitType.ARMORED:        4.0;
            case FeUnitType.MOUNTED:        4.0;
            case FeUnitType.FLYING:         1.0;
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