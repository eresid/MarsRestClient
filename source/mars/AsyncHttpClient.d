module mars.AsyncHttpClient;

import std.net.curl;

import mars.HttpResponseHandler;
import mars.HttpClient;
import mars.HttpClientOptions;
import mars.RequestParams;
import mars.ServerException;
import mars.StatusCode;

class AsyncHttpClient : HttpClient {
	
	private HttpClientOptions mOptions;
	private HTTP mHttp;
	
	this(HttpClientOptions options) {
		mOptions = options;
		mHttp = HTTP();
	}
	
	void post(string url, HttpResponseHandler responseHandler) {
		post(url, null, null, responseHandler);
	}
	
	void post(string url, RequestParams params, HttpResponseHandler responseHandler) {
		post(url, params, null, responseHandler);
	}
	
	void post(string url, RequestParams params, string[string] headers, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.post, url, params, headers, responseHandler);
	}
	
	void get(string url, HttpResponseHandler responseHandler) {
		get(url, null, null, responseHandler);
	}
	
	void get(string url, RequestParams params, HttpResponseHandler responseHandler) {
		get(url, params, null, responseHandler);
	}
	
	void get(string url, RequestParams params, string[string] headers, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.get, url, params, headers, responseHandler);
	}
	
	private void doRequest(HTTP.Method httpMethod, string url, RequestParams params, string[string] headers, HttpResponseHandler responseHandler) {
		import std.stdio;
		import std.conv;
		
		int statusCode = StatusCode.BAD_REQUEST;
		string[string] responseHeaders;
		ubyte[] responseBody;

		mHttp.method = httpMethod;
		mHttp.url = getCorrectUrl(url);
		mHttp.onReceiveStatusLine = (HTTP.StatusLine status) {
			statusCode = status.code;
		};
		mHttp.onReceiveHeader = (in char[] key, in char[] value) {
			responseHeaders[to!string(key)] = to!string(value);
		};
		mHttp.onReceive = (ubyte[] data) {
			responseBody = data;
			return data.length;
		};
		mHttp.onProgress = (size_t dltotal, size_t dlnow, size_t ultotal, size_t ulnow) {
			// writeln("Progress ", dltotal, ", ", dlnow, ", ", ultotal, ", ", ulnow);
			return 0;
		};
		mHttp.perform();
		
		if (StatusCode.isSuccess(statusCode)) {
			responseHandler.onSuccess(statusCode, responseHeaders, responseBody);
		} else {
			responseHandler.onFailure(statusCode, responseHeaders, responseBody, new ServerException(statusCode));
		}
	}
	
	private string getCorrectUrl(string url) {
		import std.algorithm.searching;
		
		if (url.startsWith("http")) {
			return url;
		}
		
		if (mOptions.baseUrl is null) {
			throw new Exception("Cannot get URL, please, set base URL!");
		}
		
		return mOptions.baseUrl ~ url;
	}
}
