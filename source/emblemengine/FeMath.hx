package emblemengine;

/** FeMath Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  Mathematical facilities for an FE game.  These are needed beyond what is
 *  provided in either of Math and FlxMath
 *  **************************************************************************/
class FeMath {
/**
 *  Bounds the value by low and high.  FlxMath has a float version.  Use this Int version for performance.
 *  @param value
 *  @param low
 *  @param high
 *  @return low if value < low, high if value > high, otherwise value
 */
    public static function ibound(value:Int, low:Int, high:Int):Int {
        value = value < low ? low : value;
        return value > high ? high : value;
    }
}