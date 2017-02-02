module vksdk.httpclient.RequestsTransportClient;

import std.datetime;
import std.experimental.logger.filelogger;
import std.stdio;

import vksdk.client.ClientResponse;
import vksdk.client.TransportClient;
import requests;

class RequestsTransportClient : TransportClient {

	private FileLogger logger;

    //private immutable ConnectionsSupervisor supervisor;
    private static RequestsTransportClient instance;

    private this() {
		logger = new FileLogger("logFile");
		//supervisor = new ConnectionsSupervisor();
    }

    static TransportClient getInstance() {
        if (instance is null) {
            instance = new RequestsTransportClient;
        }

        return instance;
    }

    private ClientResponse call(Request request, string url, string requestBody, bool isPost) {
		//auto request = Request;
		if (isPost) {
			request.headers["Content-Type"] = "application/x-www-form-urlencoded";
		}
		request.verbosity = 3;
		request.timeout = 60.seconds;

        for (int i = 0; i < 3; i++) {
            try {
                //supervisor.addRequest(request);

                long startTime = Clock.currTime();

                Response response;
				if (requestBody != null) {
					response = request.post(url, requestBody);
				} else {
					response = request.post(url);
				}

                logger.log("%s\t\t%s", url, Clock.currTime() - startTime);

                //supervisor.removeRequest(request);
                
                return new ClientResponse(response.code, response.responseBody, response.responseHeaders);
            } catch (SocketException e) {
                logger.warningf("Network troubles:\n%s", e.msg);
                throw e;
            }
        }
    }
    
    private ClientResponse call(string url, MultipartForm form) {
		auto request = Request;
		request.verbosity = 3;
		request.timeout = 60.seconds;
		// TODO
		auto rs = rq.post(url, form);
		
	}

    override ClientResponse post(string url, string requestBody) {
        return call(request, url, requestBody, true);
    }

	override ClientResponse post(string url) {
		return call(url, null, true);
    }

    override ClientResponse post(string url, string fileName, File file) {
		MultipartForm form;
		form.add(formData("file", file, ["filename": fileName, "Content-Type": "text/plain"]));

        return call(url, form);
    }
}
