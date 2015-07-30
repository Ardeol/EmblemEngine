package emblemengine.core;

import emblemengine.error.FeParserError;

/** FeParams Class
 *  @author  Timothy Foster
 *  @version A.00
 *
 *  **************************************************************************/
/*
@:forward(keys)
abstract FeParams(Map<String, FeParamSection>) from Map<String, FeParamSection> {
    public inline function new() {
        this = new Map<String, FeParamSection>();
        this.set("", new FeParamSection());
    }
    
    public static function parse(txt:String):FeParams {
        var params = new Map<String, FeParamSection>();
        
        var commentPattern = ~/^\s*[;#!]/;
        var sectionPattern = ~/^\s*\[\s*([^\]]*)\s*\]/;
        var valuePattern   = ~/^\s*([\w\.\-_]+)\s*[=:]\s*(.*)/;
        
        params.set("", new FeParamSection());
        var curSection = params.get("");
        var lines = ~/\r\n|\r|\n/g.split(txt);
        for (line in lines) {
            if (commentPattern.match(line))
                continue;
            else if (sectionPattern.match(line)) {
                var sectionName = sectionPattern.matched(1).toLowerCase();
                if (!params.exists(sectionName)) {
                    curSection = new FeParamSection();
                    params.set(sectionName, curSection);
                }
                else
                    curSection = params.get(sectionName);
            }
            else if (valuePattern.match(line)) {
                var param = valuePattern.matched(1);
                var value = valuePattern.matched(2);
                curSection.set(param, value);
            }
        //    else 
        //        throw new FeParserError("text file", ".ini is formatted incorrectly");
        }
        
        return params;
    }
    
    public function get<T>(param:String):T {
        var i = param.indexOf(".");
        if (i < 0)
            return cast(section("").get(param), T);
        else 
            return cast(section(param.substr(0, i)).get(param.substr(i + 1)),T);
    }
    
    public inline function section(name:String):FeParamSection {
        return this.get(name.toLowerCase());
    }
    
    public function toString():String {
        var s = new StringBuf();
        for (param in section("").keys())
            s.add('$param=${section("").get(param)}\n');
        for (sec in keys()) {
            if (sec == "")
                continue;
            sec = sec.toUpperCase();
            s.add('\n[$sec]\n');
            for (param in section(sec).keys())
                s.add('$param=${section("").get(param)}\n');
        }
        return s.toString();
    }
    
    public static inline var FALLBACK_PARAMS = "[UNITS]\nexpToProgress=100\nlevelToPromote=20\n[DIMENSIONS]\ntilePixelWidth=16 \ntilePixelHeight=16\n[ASSETS]\nassetPath=assets\nchapterPath=data/chapters";
}

@:forward(keys)
abstract FeParamSection(Map<String, String>) {
    public inline function new() {
        this = new Map<String, String>();
    }
    
    public inline function get(param:String):String {
        return this.get(param.toLowerCase());
    }
    
    public inline function set(param:String, value:String):Void {
        this.set(param.toLowerCase(), value);
    }
}
*/