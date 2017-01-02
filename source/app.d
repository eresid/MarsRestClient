import std.net.curl;
import std.stdio;

import mars.AsyncHttpClient;
import mars.HttpClient;
import mars.HttpClientOptions;
import mars.HttpResponseHandler;
import mars.Request;
import mars.RequestParams;
import mars.ServerException;

string BASE_URL = "https://httpbin.org/";

void main()
{
	RequestParams params = new RequestParams();
	params.put("name", "Eugene");
	params.put("age", 26);
	
	HttpClientOptions options = new HttpClientOptions;
	options.baseUrl(BASE_URL);
	options.headers = ["DefaultHeader" : "header value", "User-Agent" : "Custom User Agent", "Accept" : "Custom Accept"];
	HttpClient client = AsyncHttpClient.init(options);
	
	Request postRequest = new Request.Builder()
					.url("post?name=Eugene")
					.params(params)
					.headers(["Custom-Header1" : "value1", "Custom-Header2" : "value2"])
					.build();
	client.post(postRequest, new CredentialsHttpResponseHandler);
	
	Request getRequest = new Request.Builder()
					.url("get?name=Eugene&key1=value1&key2=value2")
					.params(params)
					.headers(["Custom-Header3" : "value3", "Custom-Header4" : "value4", "Content-Type" : "Custon Content Type"])
					.build();
	client.get(getRequest, new CredentialsHttpResponseHandler);
	
	Request delRequest = new Request.Builder()
					.url("delete?name=Eugene&key1=value1&key2=value2")
					.params(params)
					.headers(["Custom-Header5" : "value5"])
					.build();
	client.del(delRequest, new CredentialsHttpResponseHandler);
	
	Request patchRequest = new Request.Builder()
					.url("patch?name=Eugene&key1=value1&key2=value2")
					.params(params)
					.headers(["Custom-Header5" : "value5"])
					.build();
	client.patch(patchRequest, new CredentialsHttpResponseHandler);
	
	Request putRequest = new Request.Builder()
					.url("put")
					.params(params)
					.headers(["Custom-Header6" : "value6"])
					.build();
	//client.put(putRequest, new CredentialsHttpResponseHandler);
	//writeln(put("https://httpbin.org/put", "Hi!"));
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
