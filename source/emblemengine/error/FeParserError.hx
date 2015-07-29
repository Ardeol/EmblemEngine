package emblemengine.error;

/** FeParserError Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  Thrown if a parser fails, generally because the thing being parsed was 
 *  formatted incorrectly.
 *  **************************************************************************/
class FeParserError extends FeError {
    public static inline var FE_PARSER_ERROR_ID = 3001;

/**
 *  Creates a new error
 *  @param filename The file that failed
 *  @param details
 */
    public function new(?filename:String = "unknown", ?details:String = "") {
        super(FE_PARSER_ERROR_ID, 'Parse for <$filename> could not be performed ($details)');
    }
}