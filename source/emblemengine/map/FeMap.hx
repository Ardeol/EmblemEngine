package emblemengine.map;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedSpriteGroup;

import emblemengine.core.FeParams;

/** FeMap Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  **************************************************************************/
class FeMap extends FlxTypedSpriteGroup<FeTile> {

/*  Constructor
 *  =========================================================================*/
    public function new() {
        super();
    }
    
/*  Class Methods
 *  =========================================================================*/
/**
 *  Constructs a new FeMap object given an ordered set of tiles.
 *  @param width Width in tiles
 *  @param height Height in tiles
 *  @param tiles 1D array of FeTiles to load into the map
 *  @return A new FeMap
 */
    public static function build(width:Int, height:Int, tiles:Iterable<FeTile>):FeMap {
        var map = new FeMap();
        var i:Int = 0;
        for (tile in tiles) {
            tile.x = FeParams.TILE_PIXEL_WIDTH * (i % width);
            tile.y = FeParams.TILE_PIXEL_HEIGHT * Math.floor(i / width);
            map.add(tile);
            ++i;
        }
        
        return map;
    }
 
/*  Public Methods
 *  =========================================================================*/
    
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}