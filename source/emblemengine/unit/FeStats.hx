package emblemengine.unit;

import emblemengine.interfaces.IFeUnitData;

/** FeStats Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeStats implements IFeUnitData<FeStats> {
    public var attack:Int;
    public var defense:Int;
    public var resistance:Int;
    public var hit:Int;
    public var avoid:Int;
    public var crit:Int;
    public var dodge:Int;
    public var speed:Int;

/*  Constructor
 *  =========================================================================*/
    public function new() {}
    
/*  Class Methods
 *  =========================================================================*/
    public function clone():FeStats {
        var stats = new FeStats();
        stats.attack = attack;
        stats.defense = defense;
        stats.resistance = resistance;
        stats.hit = hit;
        stats.avoid = avoid;
        stats.crit = crit;
        stats.dodge = dodge;
        stats.speed = speed;
        return stats;
    }
    
    public function toString():String {
        return '[$attack, $defense, $resistance, $hit, $avoid, $crit, $dodge, $speed]';
    }
 
/*  Public Methods
 *  =========================================================================*/
    
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}