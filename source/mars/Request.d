module mars.Request;

import mars.RequestParams;

class Request {

	private string url;
	private RequestParams params;
	private string[string] headers;
	
	string getUrl() {
		return url;
	}
	
	RequestParams getParams() {
		return params;
	}
	
	string[string] getHeaders() {
		return headers;
	}
	
	private this(Builder builder) {
		url = builder.mUrl;
		params = builder.mParams;
		headers = builder.mHeaders;
	}
	
	static class Builder {
		private string mUrl;
		private RequestParams mParams;
		private string[string] mHeaders;

		Builder url(string value) {
			mUrl = value;
			return this;
		}
		
		Builder params(RequestParams value) {
			mParams = value;
			return this;
		}
		
		Builder headers(string[string] value) {
			mHeaders = value;
			return this;
		}

		Request build() {
			return new Request(this);
		}
	}
}
