package emblemengine.map;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedSpriteGroup;

import emblemengine.FeG;
import emblemengine.FeC;

/** FeMap Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  **************************************************************************/
class FeMap extends FlxTypedSpriteGroup<FeTile> {
    public var rows(default, null):Int;
    public var cols(default, null):Int;

/*  Constructor
 *  =========================================================================*/
    public function new(rows:Int, cols:Int) {
        super();
        this.rows = rows;
        this.cols = cols;
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
        var map = new FeMap(height, width);
        var i:Int = 0;
        for (tile in tiles) {
            tile.x = FeG.params.int("DIMENSIONS.tilePixelWidth") * (i % width);
            tile.y = FeG.params.int("DIMENSIONS.tilePixelHeight") * Math.floor(i / width);
            map.add(tile);
            ++i;
        }
        
        return map;
    }
 
/*  Public Methods
 *  =========================================================================*/
    public inline function tile(row:Int, col:Int):FeTile {
        return members[cols * row + col];
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}