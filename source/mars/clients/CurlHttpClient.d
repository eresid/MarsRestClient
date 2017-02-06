module mars.clients.CurlHttpClient;

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

class CurlHttpClient : HttpClient {
	
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
		import std.stdio;
		import std.conv;
		
		int statusCode = StatusCode.BAD_REQUEST;
		string[string] responseHeaders;
		ubyte[] responseBody;

		mHttp.method = httpMethod;
		mHttp.operationTimeout = mOptions.timeout;
		string requestUrl = UrlHelper.createUrl(mOptions.baseUrl, request.getUrl, request.getUrlParams, request.getParams);
		mHttp.url = requestUrl;
		
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

		try {
			mHttp.perform();
		} catch (Exception e) {
			import std.algorithm : startsWith;
			import mars.TimeoutException;

			if (e.msg.startsWith("Timeout was reached on handle")) {
				throw new TimeoutException(requestUrl);
			} else {
				throw e;
			}
		}
		
		loadDefaultHeaders();
		
		HttpResponse response = new HttpResponse.Builder()
			.url(requestUrl)
			.statusCode(statusCode)
			.headers(responseHeaders)
			.responseBody(responseBody)
			.exception(StatusCode.isSuccess(statusCode) ? null : new ServerException(statusCode))
			.build();
		
		return response;
	}
	
	private void doRequest(HTTP.Method httpMethod, HttpRequest request, HttpResponseHandler responseHandler) {
		// TODO move to thread
		//Thread t = new JobThread(httpMethod, request, responseHandler);
		//t.start();
		responseHandler.onResponse(doRequest(httpMethod, request));
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
	
	private class JobThread : Thread {

		private HTTP.Method mHttpMethod;
		private HttpRequest mRequest;
		private HttpResponseHandler mResponseHandler;
		
		this(HTTP.Method httpMethod, HttpRequest request, HttpResponseHandler responseHandler) {
			mHttpMethod = httpMethod;
			mRequest = request;
			mResponseHandler = responseHandler;
			
			super(&run);
		}

		private	void run() {
			mResponseHandler.onResponse(doRequest(mHttpMethod, mRequest));
		}
	}
}
