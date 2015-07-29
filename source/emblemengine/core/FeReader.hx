package emblemengine.core;

import haxe.Json;

import openfl.Assets;

import emblemengine.error.FeParserError;
import emblemengine.map.FeMap;
import emblemengine.map.FeTile;
import emblemengine.map.FeTileReg;

/** FeReader Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  All-static class used for reading asset data from files.
 *  **************************************************************************/
class FeReader {
/**
 *  Reads in data from the provided path and parses it as JSON.  All asset data should be in JSON format.
 *  @param path Path to asset data.  Data should be in JSON format.
 *  @return Generic object
 */
    public static function read(path:String):Dynamic {
        try {
            return Json.parse(Assets.getText(path));
        }
        catch (err:Dynamic) {
            throw new FeParserError(path, "in FeReader read");
        }
    }
    
/**
 *  Reads a map.json file and turns it into a useable FeMap.
 * 
 *  A map.json file has six fields:
 *  * width: The width of the map in tiles
 *  * height: The height of the map in tiles
 *  * tileset: Set of tile descriptions used by this map
 *  * tilesheet: Bitmap data to be used for tile display
 *  * tiles: Array of integers that are the indices of the tileset array
 *  * idles: Selects what idle animation to play on startup
 *  @param path Path to the json file
 *  @return An FeMap with FeTiles filled in
 */
    public static function readMap(path:String):FeMap {
    //  Get data
        var mapdata:MapStructure = read(path);
    
    //  Validation
        var numtiles = mapdata.width * mapdata.height;
        if (numtiles != mapdata.tiles.length || numtiles != mapdata.idles.length)
            throw new FeParserError(path, "in FeReader readMap, dimension mismatch");
            
    //  Get Tileset
        var tileset = loadTileSet(mapdata.tileset);
            
    //  Create tiles
        var tilemap:Array<FeTile> = new Array<FeTile>();
        for (i in 0...numtiles) {
            var tileinfo:TilesetElement = tileset[mapdata.tiles[i]];
            if (tileinfo.data.tilesheet == null)
                tileinfo.data.tilesheet = mapdata.tilesheet;
            var tile:FeTile = FeTileReg.create(tileinfo.name, tileinfo.anims, tileinfo.data);
            
        //  Load idle anim
            var idleanim = mapdata.idles[i];
            var idleanimstr = Std.string(idleanim);
            tile.animation.add(idleanimstr, tileinfo.idle[idleanim]);
            tile.animation.play(idleanimstr);
            
        //  Add tile
            tilemap.push(tile);
        }
        
    //  Create the map and return it
        return FeMap.build(mapdata.width, mapdata.height, tilemap);
    }
    
    
/*  Private Members
 *  =========================================================================*/
/**
 *  @private
 *  Cache for tilesets
 */
    private static var tilesets:Map<String, Tileset>;
    
/*  Private Members
 *  =========================================================================*/
/**
 *  @private
 *  Turns a tileset.json file into a Tileset array to be used by other methods.  Tilesets are cached for performace, as
 *  multiple maps can use the same tileset.
 * 
 *  A tileset json file is an array of objects with four fields each:
 *  * name: Name of the tile in the FeTileReg
 *  * idle: Array of frames used for the idle animation; only one idle animation is loaded into the tile
 *  * anims: Array of animations that can be called on; all anims are loaded into the tile
 *  * data: Arbitrary data needed for the tile
 *  @param path Path to the tileset
 *  @return A tileset, which is an array of tile descriptors
 */
    private static function loadTileSet(path:String):Tileset {
        if (tilesets == null)
            tilesets = new Map<String, Tileset>();
            
        if (tilesets.exists(path))
            return tilesets.get(path);
        
        var set:Tileset = read(path);
        tilesets.set(path, set);
        return set;
    }
}

/*  Data Structures
 *  =========================================================================*/
private typedef MapStructure = {
    var width:Int;
    var height:Int;
    var tileset:String;
    var tilesheet:String;
    var tiles:Array<Int>;
    var idles:Array<Int>;
}
 
private typedef TilesetElement = {
    var name:String;
    var idle:Array<Array<Int>>;
    var anims:FeAnimations;
    var data:Dynamic;
}
private typedef Tileset = Array<TilesetElement>;