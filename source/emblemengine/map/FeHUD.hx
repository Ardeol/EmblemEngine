package emblemengine.map;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

/** FeHUD Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  @TODO FOR REALZIES
 *  **************************************************************************/
class FeHUD extends FlxGroup {
    public var background:FlxSprite;
    
    public var nameTxt:FlxText;
    public var defTxt:FlxText;
    public var avoTxt:FlxText;
    public var hitTxt:FlxText;
    
/*  Constructor
 *  =========================================================================*/
    public function new() {
        super();
        
        background = new FlxSprite(-70, 0);
        background.makeGraphic(60, 50, 0);
        
        var x = -65;
        var y = 15;
        var wth = 60;
        
        nameTxt = new FlxText(x, y, wth, "");
        defTxt = new FlxText(x, y + 10, wth, "Def: ");
        avoTxt = new FlxText(x, y + 20, wth, "Avo: ");
        hitTxt = new FlxText(x, y + 30, wth, "Hit: ");
        
        add(background);
        add(nameTxt);
        add(defTxt);
        add(avoTxt);
        add(hitTxt);
    }
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    public function showTileInfo(tile:FeTile):Void {
        nameTxt.text = tile.name();
        defTxt.text = 'Def: ${tile.def()}';
        avoTxt.text = 'Avo: ${tile.avoid()}';
        hitTxt.text = 'Hit: ${tile.hit()}';
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}