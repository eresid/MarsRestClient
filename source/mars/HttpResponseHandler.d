module mars.HttpResponseHandler;

import mars.Response;

interface HttpResponseHandler {
	void onResponse(Response response);
}
