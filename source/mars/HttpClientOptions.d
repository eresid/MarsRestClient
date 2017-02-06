module mars.HttpClientOptions;

import std.datetime;

class HttpClientOptions {
	
	private immutable Duration DEFAULT_TIMEOUT = 30.seconds;
	private immutable int DEFAULT_MAX_PARALLEL_REQUESTS = 1;
	
	private string mUrl;
	private string[string] mHeaders;
	private Duration mTimeout;
	private int mMaxParallelRequests;
	
	this() {
		mTimeout = DEFAULT_TIMEOUT;
		mMaxParallelRequests = DEFAULT_MAX_PARALLEL_REQUESTS;
	}

	@property void baseUrl(string url) {
		mUrl = url;
	}
	
	@property string baseUrl() { return mUrl; }
	
	@property void headers(string[string] headers) {
		mHeaders = headers;
	}
	
	@property string[string] headers() { return mHeaders; }
	
	@property void timeout(Duration timeout) {
		mTimeout = timeout;
	}
	
	@property Duration timeout() { return mTimeout; }
	
	@property void maxParallelRequests(int count) {
		mMaxParallelRequests = count;
	}
	
	@property int maxParallelRequests() { return mMaxParallelRequests; }
}
