module vksdk.objects.base.BaseError;

import vibe.data.json;

import vksdk.objects.base.RequestParam;

struct BaseError {

    @name("error_code")
    int errorCode;

    @name("error_msg")
    string errorMsg;

    @name("captcha_sid")
    string captchaSid;

    @name("captcha_img")
    string captchaImgUrl;

    /**
     * Confirmation text for user
     */
    @name("confirmation_text")
    string confirmationText;

    /**
     * Redirect uri for validation request
     */
    @name("redirect_uri")
    string redirectUri;

    @name("request_params")
    RequestParam[] requestParams;

    size_t toHash() const @safe pure nothrow {
		size_t hash = errorCode.hashOf();
        hash = requestParams.hashOf(hash);
        hash = errorMsg.hashOf(hash);
        return hash;
    }

    bool opEquals(BaseError error) const @safe pure nothrow {
		return (errorCode == error.errorCode &&
			errorMsg == error.errorMsg &&
			requestParams == error.requestParams);
    }

    string toString() {
		import std.conv;
		
		return "Error{"
			~ "errorCode=" ~ to!string(errorCode)
			~ ", errorMsg='" ~ errorMsg ~ "'"
			~ ", captchaSid='" ~ captchaSid ~ "'"
			~ ", captchaImgUrl='" ~ captchaImgUrl ~ "'"
			~ ", confirmationText='" ~ confirmationText ~ "'"
			~ ", redirectUri='" ~ redirectUri ~ "'"
			~ ", requestParams=" ~ to!(string)(requestParams)
			~ "}";
    }
}
