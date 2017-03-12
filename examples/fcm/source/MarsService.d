module MarsService;

import fcm.AbstractService;
import fcm.FCMRequest;
import fcm.FCMResponse;

import mars;

import std.stdio;
import std.conv;
import vibe.data.json;

class MarsService : AbstractService {

    this(string key) {
        super(key);
    }

    override
	FCMResponse request(FCMRequest request) {
		HttpClientOptions options = new HttpClientOptions;
		options.headers = ["Authorization" : "key=" ~ serverApiKey, "Content-Type" : "application/json"];
		HttpClient client = CurlHttpClient.init(options);

		writeln(options.headers);
		writeln(request.serializeToJsonString());

		HttpRequest postRequest = new HttpRequest.Builder()
					.url("https://fcm.googleapis.com/fcm/send")
					.data(request.serializeToJsonString())
					.build();
		HttpResponse response = client.post(postRequest);

		string requestBody = response.getResponseBodyString;
		writeln(requestBody);
		writeln("StatusCode " ~ to!string(response.getStatusCode));

		enforce(StatusCode.isSuccess(response.getStatusCode), "Cannot get result! Status code = " ~ to!string(response.getStatusCode));

		return deserializeJson!FCMResponse(requestBody);
	}
}
