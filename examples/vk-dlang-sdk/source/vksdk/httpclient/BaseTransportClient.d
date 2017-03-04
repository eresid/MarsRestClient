module vksdk.httpclient.BaseTransportClient;

import vksdk.client.ClientResponse;
import vksdk.client.TransportClient;

abstract class BaseTransportClient : TransportClient {

    protected immutable string CONTENT_TYPE = "application/x-www-form-urlencoded";
    protected immutable string USER_AGENT = "Dlang VK SDK/0.4.2";

    //private FileLogger logger;
    //private immutable ConnectionsSupervisor supervisor;

    private this() {
        //logger = new FileLogger("logFile");
        //supervisor = new ConnectionsSupervisor();
    }

    abstract void call(string url, string requestBody);

    override abstract ClientResponse post(string url, string fileName, File file);

    override ClientResponse post(string url, string requestBody) {
        return call(url, requestBody);
    }

    override ClientResponse post(string url) {
        return call(url, null);
    }
}