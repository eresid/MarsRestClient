module vksdk.client.actors.ServiceActor;

import vksdk.client.actors.Actor;

class ServiceActor : Actor {

    private int appId;
    private string clientSecret;
    private string accessToken;

    this(int appId, string clientSecret, string accessToken) {
        this.appId = appId;
        this.clientSecret = clientSecret;
        this.accessToken = accessToken;
    }

    override int getId() {
        return appId;
    }

    override string getClientSecret() {
        return clientSecret;
    }

    override string getAccessToken() {
        return accessToken;
    }
}
