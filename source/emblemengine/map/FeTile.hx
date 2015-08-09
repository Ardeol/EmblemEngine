package emblemengine.map;

import flixel.FlxSprite;

import emblemengine.FeG;
import emblemengine.core.FeAnimations;
import emblemengine.unit.FeUnitType;

/** FeTile Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  **************************************************************************/
class FeTile extends FlxSprite {

/*  Constructor
 *  =========================================================================*/
    public function new(tilesheetPath:String, anims:FeAnimations) {
        super();
        this.loadGraphic(tilesheetPath, true, FeG.params.int("DIMENSIONS.tilePixelWidth"), FeG.params.int("DIMENSIONS.tilePixelHeight"));
        
        for (anim in anims)
            animation.add(anim.name, anim.frames, 30, anim.looped);
    }
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Tile Properties
 *  =========================================================================*/
    public function name():String
        return "UNNAMED TILE";
        
    public function def(?type:FeUnitType):Int
        return 0;
    
    public function avoid(?type:FeUnitType):Int
        return 0;
    
    public function hit(?type:FeUnitType):Int
        return 0;
    
    public function moveCost(type:FeUnitType):Float
        return 1.0;
        
    public function blocksProjectiles():Bool
        return false;
 
/*  Public Methods
 *  =========================================================================*/
    override public function toString():String {
        return name();
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
}