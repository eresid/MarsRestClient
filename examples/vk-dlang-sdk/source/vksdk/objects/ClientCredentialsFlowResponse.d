module vksdk.objects.ClientCredentialsFlowResponse;

import vibe.data.json;

struct ClientCredentialsFlowResponse {

    @name("access_token")
    string accessToken;

    size_t toHash() {
        return accessToken.hashOf();
	}

    bool opEquals(ClientCredentialsFlowResponse obj) {
        return accessToken == obj.accessToken;
    }

    string toString() {
        return "ClientCredentialsFlowResponse{accessToken='" ~ accessToken ~ "'}";
    }
}
