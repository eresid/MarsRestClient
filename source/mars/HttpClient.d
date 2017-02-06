module mars.HttpClient;

import mars.HttpClientOptions;
import mars.HttpRequest;
import mars.HttpResponse;
import mars.HttpResponseHandler;

interface HttpClient {

	static HttpClient init(HttpClientOptions options);

	void post(HttpRequest request, HttpResponseHandler responseHandler);

	HttpResponse post(HttpRequest request);

	void get(HttpRequest request, HttpResponseHandler responseHandler);

	HttpResponse get(HttpRequest request);

	void put(HttpRequest request, HttpResponseHandler responseHandler);

	HttpResponse put(HttpRequest request);

	void del(HttpRequest request, HttpResponseHandler responseHandler);

	HttpResponse del(HttpRequest request);

	void patch(HttpRequest request, HttpResponseHandler responseHandler);

	HttpResponse patch(HttpRequest request);
}
