import std.net.curl;
import std.stdio;

import mars;

string BASE_URL = "https://httpbin.org/";

void main()
{	
	RequestParams params = new RequestParams();
	params.put("name", "Eugene");
	params.put("age", 26);
	
	HttpClientOptions options = new HttpClientOptions;
	options.baseUrl(BASE_URL);
	options.headers = ["DefaultHeader" : "header value", "User-Agent" : "Custom User Agent", "Accept" : "Custom Accept"];
	HttpClient client = CurlHttpClient.init(options);
	
	Request postRequest = new Request.Builder()
					.url("post?name=Eugene")
					.data(params.toJson)
					.headers(["Custom-Header1" : "value1", "Custom-Header2" : "value2"])
					.build();
	//client.post(postRequest, new ResponseListener);
	
	Request getRequest = new Request.Builder()
					.url("get?name=Eugene&key1=value1&key2=value2")
					.headers(["Custom-Header3" : "value3", "Custom-Header4" : "value4", "Content-Type" : "Custon Content Type"])
					.build();
	//client.get(getRequest, new ResponseListener);
	
	Request delRequest = new Request.Builder()
					.url("delete?name=Eugene&key1=value1&key2=value2")
					.data(params.toJson)
					.headers(["Custom-Header5" : "value5"])
					.build();
	//client.del(delRequest, new ResponseListener);
	
	Request patchRequest = new Request.Builder()
					.url("patch?name=Eugene&key1=value1&key2=value2")
					.data(params.toJson)
					.headers(["Custom-Header5" : "value5"])
					.build();
	//client.patch(patchRequest, new ResponseListener);
	
	Request putRequest = new Request.Builder()
					.url("put")
					.data(params.toJson)
					.headers(["Custom-Header6" : "value6"])
					.build();
	//client.put(putRequest, new ResponseListener);
	writeln("Finish main!");
}

private class ResponseListener : HttpResponseHandler {
	void onResponse(Response response) {
		import std.conv : to;
		
		writeln("onResponse " ~ to!string(response.getStatusCode));
		foreach(key, value; response.getHeaders) {
			writeln(key ~ ": " ~ value);
		}
		writeln(cast(string)response.getResponseBody);
	}
}

unittest {
	import std.datetime;
	import std.algorithm : startsWith;
	
	HttpClientOptions options = new HttpClientOptions;
	options.baseUrl(BASE_URL);
	options.timeout = 1.seconds;
	HttpClient client = CurlHttpClient.init(options);

	try {
		client.get(new Request.Builder().url("delay/5").build(), new ResponseListener);
		assert(false);
	} catch (Exception e) {
		assert(cast(TimeoutException)e);
		assert(e.msg.startsWith("Timeout exception:"));
	}
}
