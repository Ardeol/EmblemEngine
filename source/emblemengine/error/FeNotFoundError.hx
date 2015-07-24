package emblemengine.error;

/** FeNotFoundError Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
class FeNotFoundError extends FeError {
    public static inline var FE_NOT_FOUND_ERROR_ID = 2001;

    public function new(?details:String = "") {
        super(FE_NOT_FOUND_ERROR_ID, 'Target could not be found at runtime ($details)');
    }
}