module mars.RequestParams;

import std.conv;

class RequestParams {
	
	private string[string] params;
	
	string[string] getParams() {
		return params;
	}
	
	string toJson() {
		import std.json;
		
		return JSONValue(params).toString;
	}
	
	/**
	 * string value
	 */
	void put(string key, string value) {
		params[key] = value;
	}
	
	/**
	 * boolean value
	 */
	void put(string key, bool value) {
		params[key] = to!string(value);
	}
	
	/**
	 * signed 8 bits
	 */
	void put(string key, byte value) {
		params[key] = to!string(value);
	}
	
	/**
	 * signed 16 bits
	 */
	void put(string key, short value) {
		params[key] = to!string(value);
	}
	
	/**
	 * signed 32 bits
	 */
	void put(string key, int value) {
		params[key] = to!string(value);
	}
	
	/**
	 * signed 64 bits
	 */
	void put(string key, long value) {
		params[key] = to!string(value);
	}
	
	/**
	 * 32 bit floating point
	 */
	void put(string key, float value) {
		params[key] = to!string(value);
	}
	
	/**
	 * 64 bit floating point
	 */
	void put(string key, double value) {
		params[key] = to!string(value);
	}
	
	/**
	 * largest FP size implemented in hardwareImplementation Note:
	 * 80 bits for x86 CPUs or double size, whichever is larger
	 */
	void put(string key, real value) {
		params[key] = to!string(value);
	}
}
