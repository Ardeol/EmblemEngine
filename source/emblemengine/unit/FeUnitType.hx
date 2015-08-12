package emblemengine.unit;

/** FeUnitType Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
@:enum abstract FeUnitType(String) from String to String {
    var INFANTRY = "infantry";
    var LIGHT_INFANTRY = "light_infantry";
    var ARMORED = "armored";
    var CALVARY = "calvary";
    var PEGASUS = "pegasus";
    var DRAGON  = "dragon";
}