module vksdk.client.actors.GroupActor;

import vksdk.client.actors.Actor;

class GroupActor : Actor {

    private int groupId;
    private string accessToken;

    this(int groupId, string accessToken) {
        this.groupId = groupId;
        this.accessToken = accessToken;
    }

    override int getId() {
        return -groupId;
    }

    override string getGroupId() {
        return groupId;
    }

    override string getAccessToken() {
        return accessToken;
    }
}
