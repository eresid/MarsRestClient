module vksdk.client.VkApiClient;

import vksdk.actions.OAuth;
import vksdk.client.TransportClient;

class VkApiClient {

	private immutable string API_VERSION = "5.62";
	private immutable string API_ADDRESS = "https://api.vk.com/method/";

	private TransportClient transportClient;

	this(TransportClient transportClient) {
        this.transportClient = transportClient;
    }

    TransportClient getTransportClient() {
        return transportClient;
    }

    string getEndpoint() {
        return API_ADDRESS;
    }

    string getVersion() {
        return API_VERSION;
    }

	OAuth oauth() {
        return new OAuth(this);
    }
 /*
    public Account account() {
        return new Account(this);
    }

    public Auth auth() {
        return new Auth(this);
    }

    public Friends friends() {
        return new Friends(this);
    }

    public Users users() {
        return new Users(this);
    }

    public com.vk.api.sdk.actions.Utils utils() {
        return new com.vk.api.sdk.actions.Utils(this);
    }

    public Wall wall() {
        return new Wall(this);
    }

    public Execute execute() {
        return new Execute(this);
	}*/
}
