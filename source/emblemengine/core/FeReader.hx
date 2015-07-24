package emblemengine.core;

import haxe.Json;

import openfl.Assets;

import emblemengine.map.FeMap;

/** FeReader Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  Used for reading asset data from files.
 *  **************************************************************************/
class FeReader {
    
/**
 *  Reads in data from the provided path and parses it as JSON.  All asset data should be in JSON format.
 *  @param path Path to asset data.  Data should be in JSON format.
 *  @return Generic object
 */
    public static function read(path:String):Dynamic {
        return Json.parse(Assets.getText(path));
    }
    
    public static function readMap(path:String):FeMap {
        
    }
    
/*  Private Members
 *  =========================================================================*/
    private static var tilesets:Map<String, Tileset>;
    
/*  Private Members
 *  =========================================================================*/
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
private typedef TilesetElement = {
    var name:String;
    var data:Dynamic;
}
private typedef Tileset = Array<TilesetElement>;