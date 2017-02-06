module mars.clients.RequestsHttpClient;

import core.thread;
import std.net.curl;
import std.stdio;

import mars.HttpResponseHandler;
import mars.HttpClient;
import mars.HttpClientOptions;
import mars.HttpRequest;
import mars.HttpResponse;
import mars.RequestParams;
import mars.ServerException;
import mars.StatusCode;
import mars.UrlHelper;

import requests;

class RequestsHttpClient : HttpClient {
	
	private HttpClientOptions mOptions;
	
	private this(HttpClientOptions options) {
		mOptions = options;
	}
	
	static HttpClient init(HttpClientOptions options) {
		return new this(options);
	}
	
	void post(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.post, request, responseHandler);
	}
	
	HttpResponse post(HttpRequest request) {
		return doRequest(HTTP.Method.post, request);
	}
	
	void get(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.get, request, responseHandler);
	}
	
	HttpResponse get(HttpRequest request) {
		return doRequest(HTTP.Method.get, request);
	}
	
	void put(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.put, request, responseHandler);
	}
	
	HttpResponse put(HttpRequest request) {
		return doRequest(HTTP.Method.put, request);
	}
	
	void del(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.del, request, responseHandler);
	}
	
	HttpResponse del(HttpRequest request) {
		return doRequest(HTTP.Method.del, request);
	}
	
	void patch(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.patch, request, responseHandler);
	}
	
	HttpResponse patch(HttpRequest request) {
		return doRequest(HTTP.Method.patch, request);
	}

    void upload(HttpRequest request, File file, HttpResponseHandler responseHandler) {
        // TODO move to thread
        responseHandler.onResponse(upload(request, file));
    }

    HttpResponse upload(HttpRequest request, File file) {
        return null;
    }
	
	HttpResponse doRequest(HTTP.Method httpMethod, HttpRequest request) {
        auto rq = Request();
		
		// TODO
		
		/*Response response = new Response.Builder()
			.url(requestUrl)
			.statusCode(statusCode)
			.headers(responseHeaders)
			.responseBody(responseBody)
			.exception(StatusCode.isSuccess(statusCode) ? null : new ServerException(statusCode))
			.build();
		
		return response;*/
		return null;
	}
	
	private void doRequest(HTTP.Method httpMethod, HttpRequest request, HttpResponseHandler responseHandler) {
		// TODO move to thread
		responseHandler.onResponse(doRequest(httpMethod, request));
	}
}
