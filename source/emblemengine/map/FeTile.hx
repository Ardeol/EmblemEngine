package emblemengine.map;

import flixel.FlxSprite;

import emblemengine.FeG;
import emblemengine.core.FeAnimations;

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
        this.loadGraphic(tilesheetPath, true, FeG.params.get("DIMENSIONS.tilePixelWidth"), FeG.params.get("DIMENSIONS.tilePixelHeight"));
        
        for (anim in anims)
            animation.add(anim.name, anim.frames, 30, anim.looped);
    }
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    override public function toString():String {
        return "Tile";
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}