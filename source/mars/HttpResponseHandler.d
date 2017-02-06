module mars.HttpResponseHandler;

import mars.HttpResponse;

interface HttpResponseHandler {
	void onResponse(HttpResponse response);
}
