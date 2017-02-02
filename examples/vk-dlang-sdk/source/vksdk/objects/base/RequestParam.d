module vksdk.objects.base.RequestParam;

import vibe.data.json;

struct RequestParam {

    @name("key")
    string key;

    @name("value")
    string value;

    size_t toHash() const @safe pure nothrow {
        size_t hash = value.hashOf();
        hash = key.hashOf(hash);
        return hash;
    }

    bool opEquals(RequestParam requestParam) const @safe pure nothrow {
		return key == requestParam.key && value == requestParam.value;
    }

    string toString() {
		return "RequestParam{"
			~ "key='" ~ key ~ "'"
			~ ", value='" ~ value ~ "'"
			~ "}";
    }
}

unittest {
	RequestParam element1;
	element1.key = "key1";
	element1.value = "value1";
	
	RequestParam element2;
	element2.key = "key1";
	element2.value = "value1";
	
	assert(element1 == element2);
}

unittest {
	RequestParam element1;
	element1.key = "key1";
	element1.value = "value1";
	
	RequestParam element2;
	element2.key = "key2";
	element2.value = "value2";
	
	assert(element1 != element2);
}

unittest {
	string requestParamsString = "RequestParam{key='key1', value='value1'}";

	RequestParam element;
	element.key = "key1";
	element.value = "value1";

	assert(element.toString == requestParamsString);
}

unittest {
	RequestParam element1;
	element1.key = "key1";
	element1.value = "value1";
	
	RequestParam element2;
	element2.key = "key1";
	element2.value = "value1";
	
	import std.stdio;
	writeln(element1.toHash);
	writeln(element2.toHash);

	assert(element1.toHash == element2.toHash);
}
