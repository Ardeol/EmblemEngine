package emblemengine.map;

import emblemengine.core.FeAnimations;
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
    private static var initialized:Bool = false;
    
/**
 *  Initializes the tile registry.
 * 
 *  @TODO Build with a macro, based on all the classes in map.tiles?
 */
    public static function init():Void {
        if(!initialized) {
            registry = new Map< String, Class<FeTile> >();
            registry.set(FeGrassTile.REG_NAME, FeGrassTile);
            registry.set(FeFloorTile.REG_NAME, FeFloorTile);
            registry.set(FeThicketTile.REG_NAME, FeThicketTile);
            registry.set(FeForestTile.REG_NAME, FeForestTile);
            registry.set(FeMountainTile.REG_NAME, FeMountainTile);
            registry.set(FePathTile.REG_NAME, FePathTile);
            
            initialized = true;
        }
    }
    
/**
 *  Creates a single tile based on the given string id.  Animations and data must also be provided.
 *  @param tile A string ID that identifies the tile type to create
 *  @param anims List of animations to be loaded onto the tile
 *  @param data Arbitrary data needed for the tile in question
 *  @return An FeTile that is of the appropriate type
 */
    public static function create(tile:String, anims:FeAnimations, data:Dynamic):FeTile {
        if (!registry.exists(tile))
            throw new FeNotFoundError('in FeTileReg create, searched for $tile');
        return Type.createInstance(registry.get(tile), [anims, data]);
    }
}