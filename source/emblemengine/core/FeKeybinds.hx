package emblemengine.core;

/** FeKeybinds Class
 *  @author  Timothy Foster
 *  @version A.00.150809
 *
 *  Access to key values dictated by the ini file.  This class allows users
 *  to easily customize their keybinds if desired.  Semantically, this is to
 *  be read as FeG.key.up is the "up action", *not* the up key itself.
 * 
 *  For performance, we create direct access to key arrays rather than going
 *  through the params double hashmap.  Since we expect these arrays to be
 *  called every frame, we do not want to double-hash multiple times per
 *  frame!
 * 
 *  @usage if(FlxG.keys.anyPressed(FeG.key.directions))
 *  **************************************************************************/
class FeKeybinds {
    public var up(default, null):Array<String>;
    public var right(default, null):Array<String>;
    public var down(default, null):Array<String>;
    public var left(default, null):Array<String>;
    public var select(default, null):Array<String>;
    public var cancel(default, null):Array<String>;
    public var start(default, null):Array<String>;
    
    public var all(default, null):Array<String>;
    public var directions(default, null):Array<String>;

/*  Constructor
 *  =========================================================================*/
/**
 *  Create a keybind instance given some parameters.  Should only be created in FeG.
 *  @param params
 */
    public function new(params:FeParams) {
        this.params = params;
        refresh();
    }
 
/*  Public Methods
 *  =========================================================================*/
/**
 *  Reflects changes made in the keybinds.
 * 
 *  If the parameters for the ini file are changed but refresh() is not called, then the old keybinds will be used.
 *  This method must be called in order to use the new keybinds.
 */
    public function refresh():Void {
        this.up     = [params.get("KEYBINDS.up")];
        this.right  = [params.get("KEYBINDS.right")];
        this.down   = [params.get("KEYBINDS.down")];
        this.left   = [params.get("KEYBINDS.left")];
        this.select = [params.get("KEYBINDS.select")];
        this.cancel = [params.get("KEYBINDS.cancel")];
        this.start  = [params.get("KEYBINDS.start")];
        
        this.directions = [up[0], right[0], down[0], left[0]];
        this.all = [select[0], cancel[0], start[0]].concat(this.directions);
    }
 
/*  Private Members
 *  =========================================================================*/
    private var params:FeParams;
    
}