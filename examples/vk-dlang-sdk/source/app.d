module main;

import std.stdio;
import std.experimental.logger;

import vksdk;

void main()
{
    VkKeys vkKeys = new VkKeys;
    writeln("vkKeys.appId: ", vkKeys.appId);
    writeln("vkKeys.clientSecret ", vkKeys.clientSecret);
    writeln("vkKeys.redirectUri: ", vkKeys.redirectUri);
    writeln("vkKeys.code: ", vkKeys.code);

	TransportClient client = MarsTransportClient.getInstance;
	VkApiClient vk = new VkApiClient(client);

	try {
		AuthResponse authResponse = vk.oauth()
			.userAuthorizationCodeFlow(vkKeys.appId, vkKeys.clientSecret, vkKeys.redirectUri, vkKeys.code)
			.execute();

		writeln("access_token: ", authResponse.accessToken);
		writeln("user_id: ", authResponse.userId);
		writeln("expires_in: ", authResponse.expiresIn);
		writeln("error: ", authResponse.error);

		UserActor actor = new UserActor(authResponse.userId, authResponse.accessToken);
	} catch (ApiException e1) {
		log(e1.msg);
	} catch (ClientException e2) {
		log(e2.msg);
	}
}

class VkKeys {

    private immutable VK_CREDENTIALS_FILE = "vk_credentials.txt";

    immutable int APP_ID = 123456;
    immutable string CLIENT_SECRET = "CLIENT_SECRET";
    immutable string REDIRECT_URI = "REDIRECT_URI";
    immutable string CODE = "CODE";

    int appId;
    string clientSecret;
    string redirectUri;
    string code;

    this() {
        import std.string : splitLines;
        import std.file : exists, readText;
        import std.conv : to;

        auto strings = readText(VK_CREDENTIALS_FILE).splitLines;

        if (exists(VK_CREDENTIALS_FILE)) {
            string line1 = strings[0];
            writeln("line1 ", line1);
            appId = to!int(line1);
            string line2 = strings[1];
            writeln("line2 ", line2);
            clientSecret = line2;
            redirectUri = null;
            code = null;
        } else {
            appId = APP_ID;
            clientSecret = CLIENT_SECRET;
            redirectUri = REDIRECT_URI;
            code = CODE;
        }
    }
}
