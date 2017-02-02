module vksdk.queries.oauth.OAuthUserAuthorizationCodeFlowQuery;

import vksdk.client.AbstractQueryBuilder;
import vksdk.client.VkApiClient;
import vksdk.objects.AuthResponse;

class OAuthUserAuthorizationCodeFlowQuery : AbstractQueryBuilder!(OAuthUserAuthorizationCodeFlowQuery, AuthResponse) {

    this(VkApiClient client, string endpoint, int clientId, string clientSecret, string redirectUri, string code) {
        super(client, endpoint, "access_token");
        
        //clientId(clientId);
        //clientSecret(clientSecret);
        //redirectUri(redirectUri);
        //code(code);
    }

    OAuthUserAuthorizationCodeFlowQuery clientId(int value) {
        return unsafeParam("client_id", value);
    }

    OAuthUserAuthorizationCodeFlowQuery clientSecret(string value) {
        return unsafeParam("client_secret", value);
    }

    OAuthUserAuthorizationCodeFlowQuery redirectUri(string value) {
        return unsafeParam("redirect_uri", value);
    }

    OAuthUserAuthorizationCodeFlowQuery code(string value) {
        return unsafeParam("code", value);
    }

    override protected OAuthUserAuthorizationCodeFlowQuery getThis() {
        return this;
    }

    override protected string[] essentialKeys() {
        return ["client_id", "client_secret", "redirect_uri", "code"];
    }
}
