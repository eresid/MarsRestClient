module fcm.FCMService;

import fcm.FCMRequest;
import fcm.FCMResponse;

import mars;

import std.stdio;
import std.conv;
import vibe.data.json;

class FCMService {

	private string serverApiKey;

	this(string key) {
		serverApiKey = key;
	}

	FCMResponse request(FCMRequest request) {
		HttpClientOptions options = new HttpClientOptions;
		options.headers = ["Authorization" : "key=" ~ serverApiKey, "Content-Type" : "application/json"];
		HttpClient client = CurlHttpClient.init(options);
		
		writeln(options.headers);
		writeln(request.serializeToJsonString());
		
		Request postRequest = new Request.Builder()
					.url("https://fcm.googleapis.com/fcm/send")
					.data(request.serializeToJsonString())
					.build();
		Response response = client.post(postRequest);
		
		string requestBody = cast(string)response.getResponseBody;
		writeln(requestBody);
		writeln("StatusCode " ~ to!string(response.getStatusCode));

		enforce(StatusCode.isSuccess(response.getStatusCode), "Cannot get result! Status code = " ~ to!string(response.getStatusCode));

		return deserializeJson!FCMResponse(requestBody);
	}
}
