module vksdk.exceptions.ApiUnknownException;

import vksdk.exceptions.ApiException;

class ApiUnknownException : ApiException {
    
    this(string message) {
        super(1, "Unknown error occurred", message);
    }
}
