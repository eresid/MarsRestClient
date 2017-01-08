module mars.Response;

import mars.ServerException;

class Response {

	private string url;
	private int statusCode;
	private string[string] headers;
	private ubyte[] responseBody;
	private ServerException exception;
	
	string getUrl() {
		return url;
	}
	
	int getStatusCode() {
		return statusCode;
	}
	
	string[string] getHeaders() {
		return headers;
	}
	
	ubyte[] getResponseBody() {
		return responseBody;
	}
	
	ServerException getException() {
		return exception;
	}
	
	private this(Builder builder) {
		url = builder.mUrl;
		statusCode = builder.mStatusCode;
		headers = builder.mHeaders;
		responseBody = builder.mResponseBody;
		exception = builder.mException;
	}
	
	static class Builder {
		private string mUrl;
		private int mStatusCode;
		private string[string] mHeaders;
		private ubyte[] mResponseBody;
		private ServerException mException;

		Builder url(string value) {
			mUrl = value;
			return this;
		}
		
		Builder statusCode(int value) {
			mStatusCode = value;
			return this;
		}
		
		Builder headers(string[string] value) {
			mHeaders = value;
			return this;
		}
		
		Builder responseBody(ubyte[] value) {
			mResponseBody = value;
			return this;
		}
		
		Builder exception(ServerException value) {
			mException = value;
			return this;
		}

		Response build() {
			return new Response(this);
		}
	}
}
