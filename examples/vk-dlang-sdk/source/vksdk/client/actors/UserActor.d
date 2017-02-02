module vksdk.client.actors.UserActor;

import vksdk.client.actors.Actor;

class UserActor : Actor {

    private int userId;
    private string accessToken;

    this(int userId, string accessToken) {
        this.accessToken = accessToken;
        this.userId = userId;
    }

    override string getAccessToken() {
        return accessToken;
    }

    override int getId() {
        return userId;
    }
}
