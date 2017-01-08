module mars.AsyncHttpClient;

import std.net.curl;

import mars.HttpResponseHandler;
import mars.HttpClient;
import mars.HttpClientOptions;
import mars.Request;
import mars.RequestParams;
import mars.ServerException;
import mars.StatusCode;
import mars.UrlHelper;

class AsyncHttpClient : HttpClient {
	
	private HttpClientOptions mOptions;
	private HTTP mHttp;
	
	private this(HttpClientOptions options) {
		mOptions = options;
		mHttp = HTTP();
		
		loadDefaultHeaders();
	}
	
	static HttpClient init(HttpClientOptions options) {
		return new this(options);
	}
	
	void post(Request request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.post, request, responseHandler);
	}
	
	void get(Request request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.get, request, responseHandler);
	}
	
	void put(Request request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.put, request, responseHandler);
	}
	
	void del(Request request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.del, request, responseHandler);
	}
	
	void patch(Request request, HttpResponseHandler responseHandler) {
		doRequest(HTTP.Method.patch, request, responseHandler);
	}
	
	private void doRequest(HTTP.Method httpMethod, Request request, HttpResponseHandler responseHandler) {
		import std.stdio;
		import std.conv;
		
		int statusCode = StatusCode.BAD_REQUEST;
		string[string] responseHeaders;
		ubyte[] responseBody;

		mHttp.method = httpMethod;
		mHttp.url = UrlHelper.createUrl(mOptions.baseUrl, request.getUrl, request.getParams);
		
		if (httpMethod != HTTP.Method.get) {
			string contentType = "Content-Type" in mOptions.headers ? mOptions.headers["Content-Type"] : null;
			if (contentType is null) {
				contentType = "Content-Type" in request.getHeaders ? request.getHeaders["Content-Type"] : "application/json";
			}
			mHttp.setPostData(request.getData, contentType);
		}
		
		if (request.getHeaders != null && request.getHeaders.length > 0) {
			foreach (name, value; request.getHeaders) {
				mHttp.addRequestHeader(name, value);
			}
		}
		
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
		
		loadDefaultHeaders();
		
		if (StatusCode.isSuccess(statusCode)) {
			responseHandler.onSuccess(statusCode, responseHeaders, responseBody);
		} else {
			responseHandler.onFailure(statusCode, responseHeaders, responseBody, new ServerException(statusCode));
		}
	}
	
	/**
	 * Remove all custom headers except the default headers
	 */
	private void loadDefaultHeaders() {
		mHttp.clearRequestHeaders;
		
		string[string] headers = mOptions.headers;
		
		if (headers != null && headers.length > 0) {
			foreach (name, value; headers) {
				mHttp.addRequestHeader(name, value);
			}
		}
	}
}
