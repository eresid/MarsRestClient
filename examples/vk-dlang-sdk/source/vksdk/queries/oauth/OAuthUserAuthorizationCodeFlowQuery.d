module vksdk.queries.oauth.OAuthUserAuthorizationCodeFlowQuery;

import vksdk.client.AbstractQueryBuilder;
import vksdk.client.VkApiClient;
import vksdk.objects.AuthResponse;

class OAuthUserAuthorizationCodeFlowQuery : AbstractQueryBuilder!(OAuthUserAuthorizationCodeFlowQuery, AuthResponse) {

    this(VkApiClient client, string endpoint, int clientId, string clientSecret, string redirectUri, string code) {
        super(client, endpoint, "access_token");
        
        setClientId(clientId);
        setClientSecret(clientSecret);
        setRedirectUri(redirectUri);
        setCode(code);
    }

    OAuthUserAuthorizationCodeFlowQuery setClientId(int value) {
        return unsafeParam("client_id", value);
    }

    OAuthUserAuthorizationCodeFlowQuery setClientSecret(string value) {
        return unsafeParam("client_secret", value);
    }

    OAuthUserAuthorizationCodeFlowQuery setRedirectUri(string value) {
        return unsafeParam("redirect_uri", value);
    }

    OAuthUserAuthorizationCodeFlowQuery setCode(string value) {
        return unsafeParam("code", value);
    }

    override protected OAuthUserAuthorizationCodeFlowQuery getThis() {
        return this;
    }

    override protected string[] essentialKeys() {
        return ["client_id", "client_secret", "redirect_uri", "code"];
    }
}
