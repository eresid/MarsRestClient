module mars.HttpRequest;

import mars.RequestParams;

class HttpRequest {

	private string url;
	private RequestParams params;
	private string data;
	private string[string] headers;
	
	string getUrl() {
		return url;
	}
	
	RequestParams getParams() {
		return params;
	}
	
	string getData() {
		return data;
	}
	
	string[string] getHeaders() {
		return headers;
	}
	
	private this(Builder builder) {
		url = builder.mUrl;
		params = builder.mParams;
		data = builder.mData;
		headers = builder.mHeaders;
	}
	
	static class Builder {
		private string mUrl;
		private RequestParams mParams;
		private string mData;
		private string[string] mHeaders;

		Builder url(string value) {
			mUrl = value;
			return this;
		}
		
		Builder params(RequestParams value) {
			mParams = value;
			return this;
		}
		
		Builder data(string value) {
			mData = value;
			return this;
		}
		
		Builder headers(string[string] value) {
			mHeaders = value;
			return this;
		}

		HttpRequest build() {
			return new HttpRequest(this);
		}
	}
}
