import std.net.curl;
import std.stdio;

import mars.AsyncHttpClient;
import mars.HttpClient;
import mars.HttpClientOptions;
import mars.HttpResponseHandler;
import mars.RequestParams;
import mars.ServerException;

string BASE_URL = "http://httpbin.org/";

void main()
{
	RequestParams params = new RequestParams();
	params.put("name", "Eugene");
	params.put("age", 26);
	
	HttpClientOptions options = new HttpClientOptions;
	options.baseUrl(BASE_URL);
	
	HttpClient client = new AsyncHttpClient(options);
	client.get("get", params, new CredentialsHttpResponseHandler);
}

private class CredentialsHttpResponseHandler : HttpResponseHandler {
	void onSuccess(int statusCode, string[string] headers, ubyte[] responseBody) {
		import std.conv;
		
		writeln("onSuccess " ~ to!string(statusCode));
		foreach(key, value; headers) {
			writeln(key ~ ": " ~ value);
		}
		writeln(cast(string)responseBody);
	}

	void onFailure(int statusCode, string[string] headers, ubyte[] responseBody, ServerException exception) {
		import std.conv;
		
		writeln("onFailure " ~ to!string(statusCode));
		foreach(key, value; headers) {
			writeln(key ~ ": " ~ value);
		}
		writeln(cast(string)responseBody);
	}
}

void getHeader() {
	// GET with custom data receivers
	auto http = HTTP("dlang.org");
	http.onReceiveHeader =
		(in char[] key, in char[] value) { writeln(key, ": ", value); };
	http.onReceive = (ubyte[] data) { /+ drop +/ return data.length; };
	http.perform();
}
