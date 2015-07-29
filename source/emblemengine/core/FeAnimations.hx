package emblemengine.core;

/** FeAnimations Class
 *  @author  Timothy Foster
 *  @version A.00.150729
 *
 *  Represents animation descriptors.  Other classes can turn these generic
 *  objects into actual animation objects.  For instance, FeTile will convert
 *  FeAnimations into FlxAnimations in an FlxAnimationController.
 *  **************************************************************************/
typedef FeAnimations = Array<FeAnimation>

typedef FeAnimation = {
    var name:String;
    var frames:Array<Int>;
    var looped:Bool;
}