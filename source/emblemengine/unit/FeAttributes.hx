package emblemengine.unit;

import emblemengine.interfaces.IFeUnitData;

/** FeAttributes Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeAttributes implements IFeUnitData<FeAttributes> {
    public var hp :Float;
    public var str:Float;
    public var mag:Float;
    public var skl:Float;
    public var spd:Float;
    public var lck:Float;
    public var def:Float;
    public var res:Float;
    public var con:Float;
    public var mov:Float;

/*  Constructor
 *  =========================================================================*/
    public function new() {}
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    public function clone():FeAttributes {
        var attr = new FeAttributes();
        attr.hp = this.hp;
        attr.str = this.str;
        attr.mag = this.mag;
        attr.skl = this.skl;
        attr.spd = this.spd;
        attr.lck = this.lck;
        attr.def = this.def;
        attr.res = this.res;
        attr.con = this.con;
        attr.mov = this.mov;
        return attr;
    }
    
    public function toString():String {
        return '[$hp, $str, $mag, $skl, $spd, $lck, $def, $res, $con, $mov]';
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}