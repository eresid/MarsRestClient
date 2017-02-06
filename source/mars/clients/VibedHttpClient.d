module mars.clients.VibedHttpClient;

import core.thread;

import mars.HttpResponseHandler;
import mars.HttpClient;
import mars.HttpClientOptions;
import mars.HttpRequest;
import mars.HttpResponse;
import mars.RequestParams;
import mars.ServerException;
import mars.StatusCode;
import mars.UrlHelper;

//import vibe.http.client;

/*
class VibedHttpClient : HttpClient {
	
	private HttpClientOptions mOptions;
	
	private this(HttpClientOptions options) {
		mOptions = options;
	}
	
	static HttpClient init(HttpClientOptions options) {
		return new this(options);
	}
	
	void post(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTPMethod.POST, request, responseHandler);
	}
	
	HttpResponse post(HttpRequest request) {
		return doRequest(HTTPMethod.POST, request);
	}
	
	void get(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTPMethod.GET, request, responseHandler);
	}
	
	HttpResponse get(HttpRequest request) {
		return doRequest(HTTPMethod.GET, request);
	}
	
	void put(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTPMethod.PUT, request, responseHandler);
	}
	
	HttpResponse put(HttpRequest request) {
		return doRequest(HTTPMethod.PUT, request);
	}
	
	void del(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTPMethod.DELETE, request, responseHandler);
	}
	
	HttpResponse del(HttpRequest request) {
		return doRequest(HTTPMethod.DELETE, request);
	}
	
	void patch(HttpRequest request, HttpResponseHandler responseHandler) {
		doRequest(HTTPMethod.PATCH, request, responseHandler);
	}
	
	HttpResponse patch(HttpRequest request) {
		return doRequest(HTTPMethod.PATCH, request);
	}
	
	HttpResponse doRequest(HTTPMethod httpMethod, HttpRequest request) {

		_res.statusCode = 0;
		string requestUrl = UrlHelper.createUrl(mOptions.baseUrl, request.getUrl, request.getParams);

        try requestHTTP(requestUrl,
                    (scope req) {
                        req.method = httpMethod;

                        if (request.getHeaders != null && request.getHeaders.length > 0) {
                            foreach (name, value; request.getHeaders) {
                                req.headers[name] = value;
                            }
                        }

                        //logInfo("body: %s",_req.toJson().toString);

                        req.writeJsonBody(_req.toJson());
                    },
                    (scope HTTPClientResponse res) {

                        _res.statusCode = res.statusCode;

                        if(res.statusCode == 200)
                            parseSuccessResult(res.readJson(), _req, _res);
                        else
                            logInfo("response: %s", cast(string)res.bodyReader.readAll());

                        Response response = new Response.Builder()
                            .url(requestUrl)
                            .statusCode(res.statusCode)
                            .headers(res.headers)
                            .responseBody(res.bodyReader.readAll())
                            .exception(StatusCode.isSuccess(statusCode) ? null : new ServerException(statusCode))
                            .build();
                        return response;
                    }
        );
        catch(Exception e)
        {
            logError("[gmc] request failed: %s",e);
        }

		// TODO
		
		return response;
		return null;
	}
	
	private void doRequest(HTTPMethod httpMethod, HttpRequest request, HttpResponseHandler responseHandler) {
		// TODO move to thread
		responseHandler.onResponse(doRequest(httpMethod, request));
	}
}*/
