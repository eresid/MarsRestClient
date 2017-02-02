module vksdk.actions.OAuth;

import vksdk.client.AbstractAction;
import vksdk.client.VkApiClient;
import vksdk.queries.oauth.OAuthServerClientCredentialsFlowQuery;
import vksdk.queries.oauth.OAuthUserAuthorizationCodeFlowQuery;

class OAuth : AbstractAction {
	
	private immutable string OAUTH_ENDPOINT = "https://oauth.vk.com/";

	/**
	 * Constructor
	 *
	 * @param client vk api client
	 */
	this(VkApiClient client) {
		super(client);
	}

	OAuthUserAuthorizationCodeFlowQuery userAuthorizationCodeFlow(int clientId, string clientSecret, string redirectUri, string code) {
		return new OAuthUserAuthorizationCodeFlowQuery(getClient(), OAUTH_ENDPOINT, clientId, clientSecret, redirectUri, code);
	}

	OAuthServerClientCredentialsFlowQuery serverClientCredentionalsFlow(int clientId, string clientSecret) {
		return new OAuthServerClientCredentialsFlowQuery(getClient(), OAUTH_ENDPOINT, clientId, clientSecret);
	}
}
