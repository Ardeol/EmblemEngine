package emblemengine.map;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxMath;
import flixel.util.FlxRect;

import emblemengine.FeC;
import emblemengine.FeG;
import emblemengine.FeMath;

/** FeCursor Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeCursor extends FlxSprite {
    public var row(default, null):Int;
    public var col(default, null):Int;

/*  Constructor
 *  =========================================================================*/
    public function new(map:FeMap) {
        super();
        initParams();
        this.row = 0;
        this.col = 0;
        this.pressCounter = 0;
        this.keys = ["UP", "RIGHT", "DOWN", "LEFT"];
        this.map = map;
        
        var cursorWidth = FeG.params.int("DIMENSIONS.cursorWidth");
        loadGraphic(FeC.PATH_CURSOR, true, cursorWidth, cursorWidth);
        animation.add(IDLE, [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2]);
        
        FlxG.camera.follow(this, FlxCamera.STYLE_TOPDOWN, FeG.params.float("SETTINGS.cameraSensitivity"));
        var helper = Math.max(FlxG.camera.width, FlxG.camera.height) / 2;
        FlxG.camera.deadzone = FlxRect.get((FlxG.camera.width - helper) / 2, (FlxG.camera.height - helper) / 2, helper, helper);
        
        animation.play(IDLE);
        updatePosition();
    }
    
/*  Flixel Core
 *  =========================================================================*/
    override public function destroy():Void {
		super.destroy();
	}

	override public function update():Void {
		super.update();
        
        if (mouseActive) {
            this.col = Math.floor(FlxG.mouse.x / tileWidth);
            this.row = Math.floor(FlxG.mouse.y / tileWidth);
            boundRowAndCol();
            updatePosition();
        }
        
    //  If a key is pressed, stop using the mouse
        if (FlxG.keys.firstJustPressed() != "")
            mouseActive = false;
        else if (FlxG.mouse.justPressed)
            mouseActive = true;
            
        if (FlxG.keys.pressed.X)
            pressCounter = PRESS_DELAY + PRESS_RATE;
            
        if (FlxG.keys.anyPressed(keys)) {
            if (pressCounter == 0 || pressCounter >= PRESS_DELAY + PRESS_RATE) {
                if (FlxG.keys.pressed.UP)
                    --row;
                if (FlxG.keys.pressed.RIGHT)
                    ++col;
                if (FlxG.keys.pressed.DOWN)
                    ++row;
                if (FlxG.keys.pressed.LEFT)
                    --col;
                if(pressCounter > 0)
                    pressCounter = PRESS_DELAY;
            }
            ++pressCounter;
            boundRowAndCol();
            updatePosition();
        }
        
        if (FlxG.keys.anyJustReleased(keys))
            pressCounter = 0;
        
	}
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    public inline function updatePosition():Void {
        x = tileWidth * col - cursorOffset;
        y = tileWidth * row - cursorOffset;
    }
    
    public inline function boundRowAndCol():Void {
        row = FeMath.ibound(row, 0, map.rows - 1);
        col = FeMath.ibound(col, 0, map.cols - 1);
    }
 
/*  Private Members
 *  =========================================================================*/
    private static inline var IDLE = "idle";
    private static inline var PRESS_DELAY = 20;
    private static inline var PRESS_RATE = 2;
 
    private var mouseActive:Bool;
    private var tileWidth:Int;
    private var cursorOffset:Int;
    private var pressCounter:Int;
    private var keys:Array<String>;
    
    private var map:FeMap;
 
/*  Private Methods
 *  =========================================================================*/
    private inline function initParams():Void {
        this.mouseActive = FeG.params.bool("SETTINGS.mouseActive");
        this.tileWidth = FeG.params.int("DIMENSIONS.tilePixelWidth");
        this.cursorOffset = Math.floor((FeG.params.int("DIMENSIONS.cursorWidth") - tileWidth) / 2);
    }

}