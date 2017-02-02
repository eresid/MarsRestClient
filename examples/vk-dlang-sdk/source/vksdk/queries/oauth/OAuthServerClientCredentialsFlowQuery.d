module vksdk.queries.oauth.OAuthServerClientCredentialsFlowQuery;;

import vksdk.client.AbstractQueryBuilder;
import vksdk.client.VkApiClient;
import vksdk.objects.ClientCredentialsFlowResponse;

class OAuthServerClientCredentialsFlowQuery : AbstractQueryBuilder!(OAuthServerClientCredentialsFlowQuery, ClientCredentialsFlowResponse) {

    this(VkApiClient client, string endpoint, int clientId, string clientSecret) {
        super(client, endpoint, "access_token");
        
        //clientId(clientId);
        //clientSecret(clientSecret);
        //grantType("client_credentials");
    }

    OAuthServerClientCredentialsFlowQuery clientId(int value) {
        return unsafeParam("client_id", value);
    }

    OAuthServerClientCredentialsFlowQuery clientSecret(string value) {
        return unsafeParam("client_secret", value);
    }

    OAuthServerClientCredentialsFlowQuery grantType(string value) {
        return unsafeParam("grant_type", value);
    }

    override protected OAuthServerClientCredentialsFlowQuery getThis() {
        return this;
    }

    override protected string[] essentialKeys() {
        return ["client_id", "client_secret"];
    }
}
