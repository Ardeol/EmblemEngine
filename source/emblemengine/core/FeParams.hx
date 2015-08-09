package emblemengine.core;

import emblemengine.error.FeParserError;

/** FeParams Class
 *  @author  Timothy Foster
 *  @version A.00.150805
 *
 *  Reads custom data in from an ini file.  This class is to be used like
 *  regular constants, except the game can be freely modded as desired.
 * 
 *  If performance becomes an issue, it is possible to move things to the
 *  FeC class.  But as these values are used for initializations, it should
 *  not be an issue.
 *  **************************************************************************/
class FeParams {
    private var sections:Map<String, FeParamSection>;
    
    public function new() {
        sections = new Map<String, FeParamSection>();
        sections.set("", new FeParamSection());
    }
    
    public function parse(txt:String):Void {
        var commentPattern = ~/^\s*[;#!]/;
        var sectionPattern = ~/^\s*\[\s*([^\]]*)\s*\]/;
        var valuePattern   = ~/^\s*([\w\.\-_]+)\s*[=:]\s*(.*)/;

        var curSection = sections.get("");
        var lines = ~/\r\n|\r|\n/g.split(txt);
        for (line in lines) {
            if (commentPattern.match(line))
                continue;
            else if (sectionPattern.match(line)) {
                var sectionName = sectionPattern.matched(1);
                if (!sections.exists(sectionName)) {
                    curSection = new FeParamSection();
                    sections.set(sectionName, curSection);
                }
                else
                    curSection = sections.get(sectionName);
            }
            else if (valuePattern.match(line)) {
                var param = valuePattern.matched(1);
                var value = valuePattern.matched(2);
                curSection.set(param, value);
            }
        //    else 
        //        throw new FeParserError("text file", ".ini is formatted incorrectly");
        }
    }
    
    public inline function section(name:String):FeParamSection
        return sections.get(name);
    
    public function get(param:String):String {
        var i = param.indexOf(".");
        if (i < 0)
            return section("").get(param);
        else 
            return section(param.substr(0, i)).get(param.substr(i + 1));
    }
    
    public inline function int(param:String):Int
	    return Std.parseInt(get(param));
	
	public inline function float(param:String):Float
	    return Std.parseFloat(get(param));
        
    public inline function bool(param:String):Bool
        return cast int(param);
    
    public function toString():String {
        var s = new StringBuf();
        for (param in section("").keys())
            s.add('$param=${section("").get(param)}\n');
        for (sec in sections.keys()) {
            if (sec == "")
                continue;
            sec = sec.toUpperCase();
            s.add('\n[$sec]\n');
            for (param in section(sec).keys())
                s.add('$param=${section(sec).get(param)}\n');
        }
        return s.toString();
    }
        
    public static inline var FALLBACK_PARAMS = "[UNITS]\nexpToProgress=100\nlevelToPromote=20\n[DIMENSIONS]\ntilePixelWidth=16 \ntilePixelHeight=16\n[ASSETS]\nassetPath=assets\nchapterPath=data/chapters";
}
 
typedef FeParamSection = Map<String, String>