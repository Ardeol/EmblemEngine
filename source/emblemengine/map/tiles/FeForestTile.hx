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
class FeForestTile extends FeTile {
    public static inline var REG_NAME = "forest";

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
        return "Forest";
        
    override public function def(?type:FeUnitType):Int
        return 1;
    
    override public function avoid(?type:FeUnitType):Int
        return 20;
    
    override public function hit(?type:FeUnitType):Int
        return -5;
    
    override public function moveCost(type:FeUnitType):Float {
        return switch(type) {
            case FeUnitType.INFANTRY:       10.0;
            case FeUnitType.LIGHT_INFANTRY: 10.0;
            case FeUnitType.ARMORED:        FeC.NON_TRAVERSABLE;
            case FeUnitType.CALVARY:        FeC.NON_TRAVERSABLE;
            case FeUnitType.PEGASUS:        1.0;
            case FeUnitType.DRAGON:         1.0;
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