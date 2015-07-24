package emblemengine.unit;

/** FeUnit Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeUnit {
    public var info(get, never):FeUnitInfo;
    public var leveler(get, never):FeLeveler;
    public var attributes(get, never):FeAttributes;
    public var growths(get, never):FeAttributes;
    public var stats(get, never):FeStats;
    
/*  Constructor
 *  =========================================================================*/
    public function new() {
        
    }
    
/*  Class Methods
 *  =========================================================================*/
    
 
/*  Public Methods
 *  =========================================================================*/
    
 
/*  Private Members
 *  =========================================================================*/
    private var info_:FeUnitInfo;
    private var leveler_:FeLeveler;
    private var attributes_:FeAttributes;
    private var growths_:FeAttributes;
    private var stats_:FeStats;
 
/*  Private Methods
 *  =========================================================================*/
//  We return clones to prevent modifications
    private inline function get_info():FeUnitInfo {
        return info_.clone();
    }
    
    private inline function get_leveler():FeLeveler {
        return leveler_.clone();
    }
    
    private inline function get_attributes():FeAttributes {
        return attributes_.clone();
    }
    
    private inline function get_growths():FeAttributes {
        return growths_.clone();
    }
    
    private inline function get_stats():FeAttributes {
        return stats_.clone();
    }
}