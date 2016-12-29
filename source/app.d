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
	options.headers = ["DefaultHeader" : "header value"];
	HttpClient client = new AsyncHttpClient(options);
	
	client.post("post?name=Eugene", params, ["CustomHeader1" : "value1", "CustomHeader2" : "value2"], new CredentialsHttpResponseHandler);
	client.get("get?key1=value1&key2=value2", params, ["CustomHeader3" : "value3", "CustomHeader4" : "value4"], new CredentialsHttpResponseHandler);
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
