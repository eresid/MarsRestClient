module mars.HttpClient;

import mars.HttpResponseHandler;
import mars.RequestParams;

interface HttpClient {
	void post(string url, HttpResponseHandler responseHandler);
	
	void post(string url, RequestParams params, HttpResponseHandler responseHandler);
	
	void post(string url, RequestParams params, string[string] headers, HttpResponseHandler responseHandler);
	
	void get(string url, HttpResponseHandler responseHandler);
	
	void get(string url, RequestParams params, HttpResponseHandler responseHandler);
	
	void get(string url, RequestParams params, string[string] headers, HttpResponseHandler responseHandler);
}
