module org.dinipra.fcm.FCMResponseError;

/// matches error responses to the correct regId
struct FCMResponseError
{
	/// corresponding registration id triggering the error
	string regId;

	/// see http://developer.android.com/google/gcm/http.html#error_codes
	string type;
}
