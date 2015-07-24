package emblemengine;

/** FeRank Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
@:enum abstract FeRank(Int) from Int to Int {
    var S = 0;
    var A = 1;
    var B = 2;
    var C = 3;
    var D = 4;
    var E = 5;
    
    var Prf = -1;
    
    public inline function toString():String {
        return switch(this) {
            case S: "S";
            case A: "A";
            case B: "B";
            case C: "C";
            case D: "D";
            case E: "E";
            case Prf: "Prf";
        }
    }
}