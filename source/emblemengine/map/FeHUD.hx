package emblemengine.map;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxPoint;

/** FeHUD Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  @TODO FOR REALZIES
 *  **************************************************************************/
class FeHUD extends FlxGroup {
    
/*  Constructor
 *  =========================================================================*/
    public function new() {
        super();
        
        this.padding = FeG.params.int("DIMENSIONS.hudPadding");
        
        tileInfo = new TileInfoHUD();
        alignElement(tileInfo, Southeast);
        
        add(tileInfo);
    }
    
/*  Class Methods
 *  =========================================================================*/
 
/*  Public Methods
 *  =========================================================================*/
    public function showTileInfo(tile:FeTile):Void {
        tileInfo.set(tile.name(), tile.def(), tile.avoid(), tile.hit());
    }
    public function alignTileInfo(alignment:HUDAlignment):Void {
        alignElement(tileInfo, alignment);
    }
 
/*  Private Members
 *  =========================================================================*/
    private var tileInfo:TileInfoHUD;
    
    private var padding:Int;
 
/*  Private Methods
 *  =========================================================================*/
    private function alignElement(elem:FlxSprite, alignment:HUDAlignment):Void {
    //  Pseudonyms
        var westX = padding;
        var centX = FlxG.width / 2 - elem.width / 2;
        var eastX = FlxG.width - elem.width - padding;
        var northY = padding;
        var centY  = FlxG.height / 2 - elem.height / 2;
        var southY = FlxG.height - elem.height - padding;
        
    //  Get point
        elem.x = switch(alignment) {
            case Northwest: westX;
            case North: centX;
            case Northeast: eastX;
            case East: eastX;
            case Southeast: eastX;
            case South: centX;
            case Southwest: westX;
            case West: westX;
            case Center: centX;
        };
        
        elem.y = switch(alignment) {
            case Northwest: northY;
            case North: northY;
            case Northeast: northY;
            case East: centY;
            case Southeast: southY;
            case South: southY;
            case Southwest: southY;
            case West: centY;
            case Center: centY;
        };
    }
}

enum HUDAlignment {
    Northwest;
    North;
    Northeast;
    East;
    Southeast;
    South;
    Southwest;
    West;
    Center;
}

/*  Basic
 *  =========================================================================*/
private class HUDBasic extends FlxSpriteGroup {
    public function new() {
        super();
        scrollFactor.x = 0;
        scrollFactor.y = 0;
    }
}

/*  Tile Info
 *  =========================================================================*/
private class TileInfoHUD extends HUDBasic {
    public function new() {
        super();
        var background = new FlxSprite();
        background.loadGraphic("assets/images/display/tileinfo.png");
        
        var winWidth = FeG.params.int("DIMENSIONS.tileInfoWindowWidth");
        var winHeight = FeG.params.int("DIMENSIONS.tileInfoWindowHeight");
        var padding = FeG.params.int("DIMENSIONS.tileInfoWindowPadding");
        
        var numberWidth = winWidth / 3 - 2 * padding;
        var numberY = winHeight / 2 + padding / 2;
        
        name = new FlxText(0, padding, winWidth);
        def = new FlxText(padding,                    numberY, numberWidth);
        avo = new FlxText(winWidth / 3 + padding,     numberY, numberWidth);
        hit = new FlxText(2 * winWidth / 3 + padding, numberY, numberWidth);
        name.setFormat(null, 16, 0x111111, FeC.ALIGN_CENTER);
        def.setFormat(null, 14, 0x111111, FeC.ALIGN_RIGHT);
        avo.setFormat(null, 14, 0x111111, FeC.ALIGN_RIGHT);
        hit.setFormat(null, 14, 0x111111, FeC.ALIGN_RIGHT);
        
        add(background);
        add(name);
        add(def);
        add(avo);
        add(hit);
    }
    
    public function set(n:String, d:Int, a:Int, h:Int):Void {
        name.text = n;
        def.text = Std.string(d);
        avo.text = Std.string(a);
        hit.text = Std.string(h);
    }
    
    private var name:FlxText;
    private var def:FlxText;
    private var avo:FlxText;
    private var hit:FlxText;
}