module vksdk.actions.OAuth;

import vksdk.client.AbstractAction;
import vksdk.client.VkApiClient;
import vksdk.queries.oauth.OAuthGroupAuthorizationCodeFlowQuery;
import vksdk.queries.oauth.OAuthServiceClientCredentialsFlowQuery;
import vksdk.queries.oauth.OAuthUserAuthorizationCodeFlowQuery;

class OAuth : AbstractAction {

	/**
	 * Constructor
	 *
	 * @param client vk api client
	 */
	this(VkApiClient client) {
		super(client);
	}

    OAuthUserAuthorizationCodeFlowQuery userAuthorizationCodeFlow(int clientId, string clientSecret, string redirectUri, string code) {
        return new OAuthUserAuthorizationCodeFlowQuery(getClient(), getClient().getOAuthEndpoint(), clientId, clientSecret, redirectUri, code);
    }

    OAuthGroupAuthorizationCodeFlowQuery groupAuthorizationCodeFlow(int clientId, string clientSecret, string redirectUri, string code) {
        return new OAuthGroupAuthorizationCodeFlowQuery(getClient(), getClient().getOAuthEndpoint(), clientId, clientSecret, redirectUri, code);
    }

    OAuthServiceClientCredentialsFlowQuery serviceClientCredentialsFlow(int clientId, string clientSecret) {
        return new OAuthServiceClientCredentialsFlowQuery(getClient(), getClient().getOAuthEndpoint(), clientId, clientSecret);
    }
}
