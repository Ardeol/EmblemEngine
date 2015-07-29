package emblemengine.error;

/** FeNotFoundError Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  Thrown for instances where a search of some kind failed at runtime.
 *  **************************************************************************/
class FeNotFoundError extends FeError {
    public static inline var FE_NOT_FOUND_ERROR_ID = 2001;

/**
 *  Creates a new error
 *  @param details
 */
    public function new(?details:String = "") {
        super(FE_NOT_FOUND_ERROR_ID, 'Target could not be found at runtime ($details)');
    }
}