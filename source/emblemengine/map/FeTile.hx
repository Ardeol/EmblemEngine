package emblemengine.map;

import flixel.FlxSprite;

import emblemengine.core.FeParams;

/** FeTile Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeTile extends FlxSprite {

/*  Constructor
 *  =========================================================================*/
    public function new(tilesheetPath:String) {
        super();
        this.loadGraphic(tilesheetPath, true, FeParams.TILE_PIXEL_WIDTH, FeParams.TILE_PIXEL_HEIGHT);
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