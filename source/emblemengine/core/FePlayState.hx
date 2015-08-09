package emblemengine.core;

import emblemengine.map.FeMap;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxCamera;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRect;

import emblemengine.map.FeCursor;
import emblemengine.map.FeHUD;

/** FePlayState Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  **************************************************************************/
class FePlayState extends FlxState {
    
/*  Core Methods
 *  =========================================================================*/
    override public function create():Void {
		super.create();
        map = FeReader.readMap("assets/data/chapters/03/map.json");
        map.x = 0;
        map.y = 0;
        add(map);
        boundCamera();
        
        cursor = new FeCursor(map);
        add(cursor);
        
        hud = new FeHUD();
        add(hud);
        var hudCam = new FlxCamera(570, 420, 60, 50);
        hudCam.follow(hud.background);
        hudCam.zoom = 1;
        FlxG.cameras.add(hudCam);
        
        prevrow = 0;
        prevcol = 0;
	}

	override public function destroy():Void {
		super.destroy();
	}

	override public function update():Void {
		super.update();
        
    /*
        if (FlxG.mouse.justPressed) {
            trace(map.tile(cursor.row, cursor.col).name());
        }
    */
        if(cursor.row != prevrow || cursor.col != prevcol) {
            hud.showTileInfo(map.tile(cursor.row, cursor.col));
            prevrow = cursor.row;
            prevcol = cursor.col;
        }
	}
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    
 
/*  Private Members
 *  =========================================================================*/
    private var map:FeMap;
    private var cursor:FeCursor;
    private var hud:FeHUD;
    
    
    private var prevrow:Int;
    private var prevcol:Int;
 
/*  Private Methods
 *  =========================================================================*/
    private function boundCamera():Void {
        FlxG.camera.bounds = new FlxRect(0, 0, map.width, map.height);
    }
}