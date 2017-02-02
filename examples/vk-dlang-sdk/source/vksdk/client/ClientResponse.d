module vksdk.client.ClientResponse;

class ClientResponse {
	
	private int statusCode;

    private string content;

    private string[string] headers;

    this(int statusCode, string content, string[string] headers) {
        this.statusCode = statusCode;
        this.content = content;
        this.headers = headers;
    }

    int getStatusCode() {
        return statusCode;
    }

    string getContent() {
        return content;
    }

    string[string] getHeaders() {
        return headers;
	}
}
