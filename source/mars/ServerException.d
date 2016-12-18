module mars.ServerException;

import mars.StatusCode;

class ServerException : Exception {
	
	private int mStatusCode;
	
	this(int statusCode) {
		super(toMessage(statusCode));
		
		statusCode = statusCode;
	}
	
	int getStatusCode() {
		return mStatusCode;
	}
	
	private string toMessage(int statusCode) {
		import std.conv;
		
		string result;
		
		switch(statusCode) {
			case StatusCode.BAD_REQUEST:
				result = "Bad Request";
				break;
			case StatusCode.UNAUTHORIZED:
				result = "Unauthorized";
				break;
			case StatusCode.FORBIDDEN:
				result = "Forbidden";
				break;
			case StatusCode.NOT_FOUND:
				result = "Not Found";
				break;
			case StatusCode.CONFLICT:
				result = "Conflict";
				break;
			default:
				result = "Unknown Error";
				
		}
		
		return to!string(statusCode) ~ result;
	}
}
