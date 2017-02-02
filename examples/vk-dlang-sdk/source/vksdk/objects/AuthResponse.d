module vksdk.objects.AuthResponse;

import vibe.data.json;

struct AuthResponse {

	@name("access_token")
    string accessToken;

    @name("user_id")
    int userId;

    @name("expires_in")
    int expiresIn;

    @name("error")
    string error;
}

unittest {
	AuthResponse authResponse;
	authResponse.accessToken = "someAcessToken";
	authResponse.userId = 9000000;
	authResponse.expiresIn = 1476274720;
	authResponse.error = "someMessageError";
	
	Json serializedJson = serialize!JsonSerializer(authResponse);
	
	checkJson(authResponse, serializedJson.toString);
}

unittest {
	string jsonString = "{\"access_token\":\"someAcessToken\",\"user_id\":9500000,\"expires_in\":1476270000,\"error\":\"someMessageError\"}";
	
	AuthResponse authResponse = deserializeJson!AuthResponse(jsonString);
	assert(authResponse.accessToken == "someAcessToken");
	assert(authResponse.userId == 9500000);
	assert(authResponse.expiresIn == 1476270000);
	assert(authResponse.error == "someMessageError");
	
	checkJson(authResponse, jsonString);
}

private void checkJson(AuthResponse authResponse, string jsonString) {
	AuthResponse localAuthResponse = deserializeJson!AuthResponse(jsonString);
	
	assert(authResponse.accessToken == localAuthResponse.accessToken);
	assert(authResponse.userId == localAuthResponse.userId);
	assert(authResponse.expiresIn == localAuthResponse.expiresIn);
	assert(authResponse.error == localAuthResponse.error);
}
