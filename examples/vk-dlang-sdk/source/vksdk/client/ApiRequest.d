module vksdk.client.ApiRequest;

import std.experimental.logger;
import std.algorithm.searching : find;

import vibe.data.json;
import std.json;

import vksdk.client.ClientResponse;
import vksdk.client.TransportClient;
import vksdk.exceptions.ApiException;
import vksdk.exceptions.ClientException;
import vksdk.exceptions.ExceptionMapper;
import vksdk.objects.base.BaseError;

abstract class ApiRequest(T) {

    private TransportClient client;

    private string url;

    this(string url, TransportClient client) {
        this.client = client;
        this.url = url;
    }

    protected string getUrl() {
        return url;
    }

    protected TransportClient getClient() {
        return client;
    }

    T execute() {
        string textResponse = executeAsString();
        JSONValue json = parseJSON(textResponse);

		if (auto errorElement = "error" in json) {
        //if (json["error"].type != JSON_TYPE.NULL) {
            //JSONValue errorElement = json["error"];
            BaseError error;
            try {
				error = deserializeJson!BaseError(errorElement.toString());
            } catch (Exception e) {
                log("Invalid JSON: %s\n%s", textResponse, e.msg);
                throw new ClientException("Can't parse json response");
            }

            ApiException exception = ExceptionMapper.parseException(error);

            log("API error: ", exception.msg);
            throw exception;
        }

        //JSONValue response = json;
        //if (json["response"].type != JSON_TYPE.NULL) {
        //    response = json["response"];
        //}
        
        JSONValue response = "response" in json ? json["response"] : json;

        try {
            return deserializeJson!T(response.toString());
        } catch (Exception e) {
            log("Invalid JSON: %s\n%s", textResponse, e.msg);
            throw new ClientException("Can't parse json response");
        }
    }

    string executeAsString() {
        ClientResponse response;
        try {
            response = client.post(url, getBody());
        } catch (Exception e) {
			log("Problems with request: %s\n%s", url, e.msg);
            throw new ClientException("I/O exception");
        }

        if (response.getStatusCode() != 200) {
            throw new ClientException("Internal API server error");
        }

        if ("Content-Type" !in response.getHeaders()) {
            throw new ClientException("No content type header");
        }

        if (response.getHeaders()["Content-Type"].find("application/json").length > 0) {
            throw new ClientException("Invalid content type");
        }

        return response.getContent();
    }

    protected abstract string getBody();
}
