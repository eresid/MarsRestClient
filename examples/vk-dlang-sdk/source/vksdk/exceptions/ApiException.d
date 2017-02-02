module vksdk.exceptions.ApiException;

import std.conv : to;

class ApiException : Exception {
    
	private int code;
    private string description;

    this(int code, string description, string message) {
		super(description ~ " (" ~ to!string(code) ~ "): " ~ message);

		this.code = code;
        this.description = description;
    }

    this(int code, string message) {
        this(code, "Unknown", message);
    }

    string getDescription() {
        return description;
    }

    int getCode() {
        return code;
    }
}
