module mars.HttpClient;

import mars.HttpClientOptions;
import mars.HttpResponseHandler;
import mars.Request;
import mars.Response;

interface HttpClient {

	static HttpClient init(HttpClientOptions options);

	void post(Request request, HttpResponseHandler responseHandler);

	Response post(Request request);

	void get(Request request, HttpResponseHandler responseHandler);

	Response get(Request request);

	void put(Request request, HttpResponseHandler responseHandler);

	Response put(Request request);

	void del(Request request, HttpResponseHandler responseHandler);

	Response del(Request request);

	void patch(Request request, HttpResponseHandler responseHandler);

	Response patch(Request request);
}
