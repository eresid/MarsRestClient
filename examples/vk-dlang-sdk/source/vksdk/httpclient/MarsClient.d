module vksdk.httpclient.MarsTransportClient;

import std.datetime;
import std.experimental.logger.filelogger;
import std.stdio;

import vksdk.client.ClientResponse;
import vksdk.client.TransportClient;
import mars;

// Singleton
// https://p0nce.github.io/d-idioms/#Leveraging-TLS-for-a-fast-thread-safe-singleton
class MarsTransportClient : BaseTransportClient {

    private __gshared static MarsTransportClient instance;

    private HttpClient client;

    static TransportClient getInstance() {
        if (instance is null) {
            instance = new MarsTransportClient;
        }

        return instance;
    }

    private this() {
        super();

		HttpClientOptions options = new HttpClientOptions;
		options.headers = ["Content-Type" : CONTENT_TYPE, "User-Agent" : USER_AGENT];
		options.timeout = 60.seconds;
		client = CurlHttpClient.init(options);
    }

    private ClientResponse call(string url, string requestBody) {
        for (int i = 0; i < 3; i++) {
            try {
                //supervisor.addRequest(request);

                //long startTime = Clock.currTime();

                Request postRequest = new Request.Builder()
                					.url(url)
                					.data(requestBody)
                					.build();
                Response response = client.post(postRequest);

                //logger.log("%s\t\t%s", url, Clock.currTime() - startTime);

                //supervisor.removeRequest(request);
                
                return new ClientResponse(response.getStatusCode, response.getResponseBodyString, response.getHeaders);
            } catch (Exception e) {
                //logger.warningf("Network troubles:\n%s", e.msg);
                throw e;
            }
        }

        throw new Exception("Something wrong");
    }
    
    /*private ClientResponse call(string url, MultipartForm form) {
		auto request = Request;
		request.verbosity = 3;
		request.timeout = 60.seconds;
		// TODO
		auto rs = rq.post(url, form);
		
	}*/

    override ClientResponse post(string url, string fileName, File file) {
		//MultipartForm form;
		//form.add(formData("file", file, ["filename": fileName, "Content-Type": "text/plain"]));

        //return call(url, form);
        return call(url, null);
    }
}
