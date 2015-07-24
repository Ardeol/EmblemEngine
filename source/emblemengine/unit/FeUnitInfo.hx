package emblemengine.unit;

import emblemengine.interfaces.IFeUnitData;

/** FeUnitInfo Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeUnitInfo implements IFeUnitData<FeUnitInfo> {
    public var name:String;
    public var age:Int;
    public var nationality:String;
    
/*  Constructor
 *  =========================================================================*/
    public function new() {}
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    public function clone():FeUnitInfo {
        var info = new FeUnitInfo();
        info.name = name;
        info.age = age;
        info.nationality = nationality;
        return info;
    }
    
    public function toString():String {
        return '[$name, $age, $nationality]';
    }
 
/*  Private Members
 *  =========================================================================*/
    
 
/*  Private Methods
 *  =========================================================================*/
    
}