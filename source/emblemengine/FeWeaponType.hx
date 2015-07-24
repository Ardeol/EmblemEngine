package emblemengine;

/** FeWeaponType Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
@:enum abstract FeWeaponType(Int) from Int to Int {
    var Sword = 2;
    var Axe = 3;
    var Lance = 5;
    var Bow = 7;
    var Knife = 11;
    var Anima = 13;
    var Wind = 221; // 13 * 17
    var Fire = 247; // 13 * 19
    var Thunder = 299; // 13 * 23
    var Light = 29;
    var Dark = 31;
    var Staff = 37;
    
/**
 *  Returns whether this is of type t.  This is sensitive to covariance.
 * 
 *  Note for example that true is returned t.is(Anima) when t is Wind, Fire, Thunder, or Anima
 *  @param t The weapon type to check against
 *  @return true if the types are compatible
 */
    public inline function is(t:FeWeaponType):Bool {
        return this % (cast t) == 0;
    }
    
}