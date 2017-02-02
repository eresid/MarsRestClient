module vksdk.queries.oauth.OAuthServiceClientCredentialsFlowQuery;;

import vksdk.client.AbstractQueryBuilder;
import vksdk.client.VkApiClient;
import vksdk.objects.ServiceClientCredentialsFlowResponse;

class OAuthServiceClientCredentialsFlowQuery : AbstractQueryBuilder!(OAuthServiceClientCredentialsFlowQuery, ServiceClientCredentialsFlowResponse) {

    this(VkApiClient client, string endpoint, int clientId, string clientSecret) {
        super(client, endpoint, "access_token");

        setClientId(clientId);
        setClientSecret(clientSecret);
        grantType("client_credentials");
    }

    OAuthServiceClientCredentialsFlowQuery setClientId(int value) {
        return unsafeParam("client_id", value);
    }

    OAuthServiceClientCredentialsFlowQuery setClientSecret(string value) {
        return unsafeParam("client_secret", value);
    }

    OAuthServiceClientCredentialsFlowQuery grantType(string value) {
        return unsafeParam("grant_type", value);
    }

    override protected OAuthServiceClientCredentialsFlowQuery getThis() {
        return this;
    }

    override protected string[] essentialKeys() {
        return ["client_id", "client_secret"];
    }
}
