module mars.HttpResponseHandler;

import mars.ServerException;

interface HttpResponseHandler {
	void onSuccess(int statusCode, string[string] headers, ubyte[] responseBody);
	
	void onFailure(int statusCode, string[string] headers, ubyte[] responseBody, ServerException exception);
}
