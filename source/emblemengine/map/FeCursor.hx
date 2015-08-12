package emblemengine.map;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxRect;

import emblemengine.FeC;
import emblemengine.FeG;
import emblemengine.FeMath;

/** FeCursor Class
 *  @author  Timothy Foster
 *  @version A.00.150809
 *
 *  The map cursor.  This displays the graphic and controls its movement.
 * 
 *  The cursor knows its coordinates on the map.  The class containing this
 *  can therefore access the location and then access the respective tile
 *  on the map.
 *  **************************************************************************/
class FeCursor extends FlxSprite {
    public var row(default, null):Int;
    public var col(default, null):Int;

/*  Constructor
 *  =========================================================================*/
/**
 *  Create the cursor.  Only one should be created at a time.
 *  @param map The map is used to determine maximum rows and columns.
 */
    public function new(map:FeMap) {
        super();
    //  Initialize variables
        initParams();
        this.row = 0;
        this.col = 0;
        this.pressCounter = 0;
        this.map = map;
        
    //  Load cursor animation
    //  @TODO Generalize the animation sequence!
        var cursorWidth = FeG.params.int("DIMENSIONS.cursorWidth");
        loadGraphic(FeC.PATH_CURSOR, true, cursorWidth, cursorWidth);
        animation.add(IDLE, [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2]);
        
    //  Set up the camera
    //  The camera follows the cursor around
        FlxG.camera.follow(this, FlxCamera.STYLE_TOPDOWN, FeG.params.float("SETTINGS.cameraSensitivity"));
        var helper = Math.max(FlxG.camera.width, FlxG.camera.height) / 2;
        FlxG.camera.deadzone = FlxRect.get((FlxG.camera.width - helper) / 2, (FlxG.camera.height - helper) / 2, helper, helper);
        
    //  Display
        animation.play(IDLE);
        updatePosition();
    }
    
/*  Flixel Core
 *  =========================================================================*/
/**
 *  Destroy the cursor.
 */
    override public function destroy():Void {
		super.destroy();
        this.map = null;
	}

/**
 *  Update the cursor every frame.
 */
	override public function update():Void {
		super.update();
        
        if (mouseActive) {
            this.col = Math.floor(FlxG.mouse.x / tileWidth);
            this.row = Math.floor(FlxG.mouse.y / tileWidth);
            boundRowAndCol();
            updatePosition();
        }
        
    //  If a key is pressed, stop using the mouse
        if (FlxG.keys.anyJustPressed(FeG.key.all))
            mouseActive = false;
        else if (FlxG.mouse.justPressed)
            mouseActive = true;
            
    //  Holding the cancel button allows for fast navigation
        if (FlxG.keys.anyPressed(FeG.key.cancel))
            pressCounter = PRESS_DELAY + PRESS_RATE;
            
        if (FlxG.keys.anyPressed(FeG.key.directions)) {
        //  Counter == 0 indicates just pressed, so move immediately; then have a delay
            if (pressCounter == 0 || pressCounter >= PRESS_DELAY + PRESS_RATE) {
                if (FlxG.keys.anyPressed(FeG.key.up))
                    --row;
                if (FlxG.keys.anyPressed(FeG.key.right))
                    ++col;
                if (FlxG.keys.anyPressed(FeG.key.down))
                    ++row;
                if (FlxG.keys.anyPressed(FeG.key.left))
                    --col;
                if(pressCounter > 0)
                    pressCounter = PRESS_DELAY;  // not 0; delays by PRESS_DELAY + PRESS_RATE at first, then only by PRESS_RATE as the button is being held
            }
            ++pressCounter;
            boundRowAndCol();
            updatePosition();
        }
        
    //  Releasing all directional arrows resets the press counter
    //  We do not reset if a key is still being held (DEFUNCT??)
        if (FlxG.keys.anyJustReleased(FeG.key.directions))// && !FlxG.keys.anyPressed(FeG.key.directions))
            pressCounter = 0;
        
	}
 
/*  Public Methods
 *  =========================================================================*/
/**
 *  Updates the graphical position based on row and column
 */
    public inline function updatePosition():Void {
        x = tileWidth * col - cursorOffset;
        y = tileWidth * row - cursorOffset;
    }
    
/**
 *  Bounds the row and column to the appropriate dimensions
 */
    public inline function boundRowAndCol():Void {
        row = FeMath.ibound(row, 0, map.rows - 1);
        col = FeMath.ibound(col, 0, map.cols - 1);
    }
 
/*  Private Members
 *  =========================================================================*/
    private static inline var IDLE = "idle";
    private static inline var PRESS_DELAY = 18;
    private static inline var PRESS_RATE = 2;
 
    private var mouseActive:Bool;
    private var tileWidth:Int;
    private var cursorOffset:Int;
    private var pressCounter:Int;
    
    private var map:FeMap;
 
/*  Private Methods
 *  =========================================================================*/
/**
 *  @private
 *  Initialize the parameters from the ini file.
 * 
 *  Note that we keep a number of member variables for performance reasons.
 */
    private inline function initParams():Void {
        this.mouseActive = FeG.params.bool("SETTINGS.mouseActive");
        this.tileWidth = FeG.params.int("DIMENSIONS.tilePixelWidth");
        this.cursorOffset = Math.floor((FeG.params.int("DIMENSIONS.cursorWidth") - tileWidth) / 2);
    }

}