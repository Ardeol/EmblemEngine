package emblemengine.unit;

import emblemengine.core.FeParams;
import emblemengine.interfaces.IFeUnitData;

/** FeLeveler Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeLeveler implements IFeUnitData<FeLeveler> {
    public var level(get, set):Int;
    public var exp(get, never):Int;
    public var totalexp:Int;

/*  Constructor
 *  =========================================================================*/
    public function new() {}
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    public function clone():FeLeveler {
        var leveler = new FeLeveler();
        leveler.totalexp = totalexp;
        return leveler;
    }
    
    public function toString():String {
        return '[$level ($exp)]';
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    private function get_level():Int {
        return (totalexp / FeParams.EXP_TO_PROGRESS) % FeParams.LEVEL_TO_PROMOTE + 1;
    }
    private function set_level(value:Int):Int {
        totalexp = (value - 1) * FeParams.EXP_TO_PROGRESS;
        return value;
    }
    private inline function get_exp():Int {
        return totalexp % FeParams.EXP_TO_PROGRESS;
    }
}