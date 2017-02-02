module vksdk.queries.oauth.OAuthGroupAuthorizationCodeFlowQuery;;

import vksdk.client.AbstractQueryBuilder;
import vksdk.client.VkApiClient;
import vksdk.objects.GroupAuthResponse;

class OAuthGroupAuthorizationCodeFlowQuery : AbstractQueryBuilder!(OAuthGroupAuthorizationCodeFlowQuery, GroupAuthResponse) {

    this(VkApiClient client, string endpoint, int clientId, string clientSecret, string redirectUri, string code) {
        super(client, endpoint, "access_token");

        setClientId(clientId);
        setClientSecret(clientSecret);
        setRedirectUri(redirectUri);
        setCode(code);
    }

    OAuthGroupAuthorizationCodeFlowQuery setClientId(int value) {
        return unsafeParam("client_id", value);
    }

    OAuthGroupAuthorizationCodeFlowQuery setClientSecret(string value) {
        return unsafeParam("client_secret", value);
    }

    public OAuthGroupAuthorizationCodeFlowQuery setRedirectUri(string value) {
            return unsafeParam("redirect_uri", value);
        }

        public OAuthGroupAuthorizationCodeFlowQuery setCode(string value) {
            return unsafeParam("code", value);
        }

    override protected OAuthGroupAuthorizationCodeFlowQuery getThis() {
        return this;
    }

    override protected string[] essentialKeys() {
        return ["client_id", "client_secret", "redirect_uri", "code"];
    }
}
