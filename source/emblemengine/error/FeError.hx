package emblemengine.error;

/** FeError Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeError {
    public var id(default, null):Int;
    public var message(get, null):String;
    
/*  Constructor
 *  =========================================================================*/
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