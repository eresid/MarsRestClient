module vksdk.objects.ServiceClientCredentialsFlowResponse;

import vibe.data.json;

class ServiceClientCredentialsFlowResponse {

    @name("access_token")
    private string accessToken;

    public string getAccessToken() {
        return accessToken;
    }
}