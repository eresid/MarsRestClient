module mars.HttpClientOptions;

class HttpClientOptions {
	
	private immutable int DEFAULT_TIMEOUT = 30;
	private immutable int DEFAULT_MAX_PARALLEL_REQUESTS = 1;
	
	private string mUrl;
	private string[string] mHeaders;
	private int mTimeoutInSeconds;
	private int mMaxParallelRequests;
	
	this() {
		mTimeoutInSeconds = DEFAULT_TIMEOUT;
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
	
	@property void timeoutInSeconds(int seconds) {
		mTimeoutInSeconds = seconds;
	}
	
	@property int timeoutInSeconds() { return mTimeoutInSeconds; }
	
	@property void maxParallelRequests(int count) {
		mMaxParallelRequests = count;
	}
	
	@property int maxParallelRequests() { return mMaxParallelRequests; }
}
