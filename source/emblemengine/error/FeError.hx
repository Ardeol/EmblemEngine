package emblemengine.error;

/** FeError Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  General error class.
 *  **************************************************************************/
class FeError {
/**
 *  Numeric id of the error; used for reporting
 */
    public var id(default, null):Int;
    
/**
 *  Descriptive message of the error
 */
    public var message(get, null):String;
    
/*  Constructor
 *  =========================================================================*/
/**
 *  Creates a new error object
 *  @param id ID for the error
 *  @param msg Message describing the error
 */
    public function new(id:Int, msg:String) {
        this.id = id;
        this.message = msg;
    }
 
/*  Private Methods
 *  =========================================================================*/
    private inline function get_message():String {
        return 'ERROR #$id: $message';
    }
}