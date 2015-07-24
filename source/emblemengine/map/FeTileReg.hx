package emblemengine.map;

import emblemengine.error.FeNotFoundError;
import emblemengine.map.tiles.*;

/** FeTileReg Class
 *  @author  Timothy Foster
 *  @version A.00.150723
 *
 *  Keeps a registry of tile classes to be created dynamically.
 *  **************************************************************************/
class FeTileReg {
    private static var registry:Map< String, Class<FeTile> >;
    
    public static function init():Void {
        registry = new Map< String, Class<FeTile> >();
        registry.set(FeGrassTile.REG_NAME, FeGrassTile);
        registry.set(FeFloorTile.REG_NAME, FeFloorTile);
    }
    
    public static function create(tile:String, data:Dynamic):FeTile {
        if (!registry.exists(tile))
            throw new FeNotFoundError('in FeTileReg create, searched for $tile');
        return Type.createInstance(registry.get(tile), [data]);
    }
}