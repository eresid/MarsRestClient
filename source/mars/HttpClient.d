module mars.HttpClient;

import mars.HttpClientOptions;
import mars.HttpResponseHandler;
import mars.Request;

interface HttpClient {
	
	static HttpClient init(HttpClientOptions options);
	
	void post(Request request, HttpResponseHandler responseHandler);
	
	void get(Request request, HttpResponseHandler responseHandler);
	
	void put(Request request, HttpResponseHandler responseHandler);
	
	void del(Request request, HttpResponseHandler responseHandler);
	
	void patch(Request request, HttpResponseHandler responseHandler);
}
