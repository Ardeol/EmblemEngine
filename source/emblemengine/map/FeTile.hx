package emblemengine.map;

import flixel.FlxSprite;

import emblemengine.core.FeAnimations;
import emblemengine.core.FeParams;

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
        this.loadGraphic(tilesheetPath, true, FeParams.TILE_PIXEL_WIDTH, FeParams.TILE_PIXEL_HEIGHT);
        
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