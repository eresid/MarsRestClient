module mars.StatusCode;

/**
 * HTTP Status Codes
 * 
 * This is a list of Hypertext Transfer Protocol (HTTP) response
 * status codes
 * 
 * http://www.restapitutorial.com/httpstatuscodes.html
 */
class StatusCode {
	
	/**
	 * Standard response for successful HTTP requests. The actual
	 * response will depend on the request method used. In a GET
	 * request, the response will contain an entity corresponding
	 * to the requested resource. In a POST request, the response
	 * will contain an entity describing or containing the result
	 * of the action.
	 */
	static immutable int OK = 200;
	
	/**
	 * The request has been fulfilled, resulting in the creation of
	 * a new resource.
	 */
	static immutable int CREATED = 201;
	
	/**
	 * The server successfully processed the request and is not
	 * returning any content.
	 */
	static immutable int NO_CONTENT = 204;
	
	/**
	 * The server cannot or will not process the request due to an
	 * apparent client error (e.g., malformed request syntax, too
	 * large size, invalid request message framing, or deceptive
	 * request routing).
	 */
	static immutable int BAD_REQUEST = 400;
	
	/**
	 * Similar to 403 Forbidden, but specifically for use when
	 * authentication is required and has failed or has not yet
	 * been provided. The response must include a WWW-Authenticate
	 * header field containing a challenge applicable to the
	 * requested resource.
	 */
	static immutable int UNAUTHORIZED = 401;
	
	/**
	 * The request was a valid request, but the server is refusing
	 * to respond to it. The user might be logged in but does not
	 * have the necessary permissions for the resource.
	 */
	static immutable int FORBIDDEN = 403;
	
	/**
	 * The requested resource could not be found but may be
	 * available in the future. Subsequent requests by the client
	 * are permissible.
	 */
	static immutable int NOT_FOUND = 404;

	/**
	 * Indicates that the request could not be processed because of
	 * conflict in the request, such as an edit conflict between
	 * multiple simultaneous updates.
	 */
	static immutable int CONFLICT = 409;

	// Help methods
	
	static bool isSuccess(int statusCode) {
		return statusCode / 100 == 2;
	}
	
	static bool isClientError(int statusCode) {
		return statusCode / 100 == 4;
	}
	
	static bool isServerError(int statusCode) {
		return statusCode / 100 == 5;
	}
}
