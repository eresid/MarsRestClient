module mars.HttpRequest;

import mars.RequestParams;

class HttpRequest {

	private string url;
	private RequestParams params;
	private string data;
	private string[string] headers;
	private string[string] urlParams;
	
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

    string[string] getUrlParams() {
        return urlParams;
    }
	
	private this(Builder builder) {
		url = builder.mUrl;
		params = builder.mParams;
		data = builder.mData;
		headers = builder.mHeaders;
		urlParams = builder.mUrlParams;
	}
	
	static class Builder {
		private string mUrl;
		private RequestParams mParams;
		private string mData;
		private string[string] mHeaders;
		private string[string] mUrlParams;

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

		Builder urlParams(string[string] value) {
            mUrlParams = value;
            return this;
        }

		HttpRequest build() {
			return new HttpRequest(this);
		}
	}
}
