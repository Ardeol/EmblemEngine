package emblemengine.map;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;
import flixel.util.FlxMath;

/** FeMapCamera Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeMapCamera extends FlxCamera {
    public var camActive(default, null):Bool;

/*  Constructor
 *  =========================================================================*/
    public function new() {
        super();
        focus = new FlxObject();
        mousePos = new FlxPoint();
        camActive = false;
        follow(focus, FlxCamera.STYLE_PLATFORMER, 10.0);
    }
    
/*  Flixel Core
 *  =========================================================================*/
    override public function destroy():Void {
		super.destroy();
        focus = null;
	}

	override public function update():Void {
		super.update();
        
        if (camActive) {
            FlxG.mouse.getWorldPosition(this, mousePos);
            focus.x = mousePos.x;
            focus.y = mousePos.y;
        }
	}
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    public function activate():Void {
        camActive = true;
    }
    
    public function deactivate():Void {
        camActive = false;
    }
    
    public function bindToMap(map:FeMap):Void {
        bounds = new FlxRect(0, 0, map.width, map.height);
    }
 
/*  Private Members
 *  =========================================================================*/
    private var focus:FlxObject;
    private var mousePos:FlxPoint;
 
/*  Private Methods
 *  =========================================================================*/
    
}