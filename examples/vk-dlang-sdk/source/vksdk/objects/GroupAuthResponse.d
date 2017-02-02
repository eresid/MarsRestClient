module vksdk.objects.GroupAuthResponse;

import vibe.data.json;

class GroupAuthResponse {

    private string[int] accessTokens;

    @name("expires_in")
    private int expiresIn;

    @name("error")
    private string error;

    public this(string[int] accessTokens, int expiresIn, string error) {
        this.accessTokens = accessTokens;
        this.expiresIn = expiresIn;
        this.error = error;
    }

    public string[int] getAccessTokens() {
        return accessTokens;
    }

    public int getExpiresIn() {
        return expiresIn;
    }

    public string getError() {
        return error;
    }
}