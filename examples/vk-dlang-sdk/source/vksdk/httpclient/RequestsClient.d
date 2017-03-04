module vksdk.httpclient.RequestsTransportClient;

import std.datetime;
import std.experimental.logger.filelogger;
import std.stdio;

import vksdk.client.ClientResponse;
import vksdk.client.TransportClient;
import requests;

class RequestsTransportClient : BaseTransportClient {

    private static RequestsTransportClient instance;

    static TransportClient getInstance() {
        if (instance is null) {
            instance = new RequestsTransportClient;
        }

        return instance;
    }

    private ClientResponse call(string url, string requestBody, bool isPost) {
        auto request = Request();
		request.addHeaders(["Content-Type" : CONTENT_TYPE, "User-Agent" : USER_AGENT]);
		request.verbosity = 3;
		request.timeout = 60.seconds;

        for (int i = 0; i < 3; i++) {
            try {
                //supervisor.addRequest(request);

                //long startTime = Clock.currTime();

                Response response;
				if (requestBody != null) {
					response = request.post(url, requestBody);
				} else {
					response = request.post(url);
				}

                //logger.log("%s\t\t%s", url, Clock.currTime() - startTime);

                //supervisor.removeRequest(request);
                
                return new ClientResponse(response.code, cast(string)response.responseBody, response.responseHeaders);
            } catch (Exception e) {
                //logger.warningf("Network troubles:\n%s", e.msg);
                throw e;
            }
        }

        throw new Exception("Something wrong");
    }
    
    private ClientResponse call(string url, MultipartForm form) {
		auto request = Request();
		request.verbosity = 3;
		request.timeout = 60.seconds;
		// TODO
		auto response = request.post(url, form);
		return new ClientResponse(response.code, cast(string)response.responseBody, response.responseHeaders);
	}

    override ClientResponse post(string url, string fileName, File file) {
		MultipartForm form;
		form.add(formData("file", file, ["filename": fileName, "Content-Type": "text/plain"]));

        return call(url, form);
    }
}
