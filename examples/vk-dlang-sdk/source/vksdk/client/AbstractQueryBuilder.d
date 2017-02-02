module vksdk.client.AbstractQueryBuilder;

import std.conv;
import std.uri;

import vksdk.client.ApiRequest;
import vksdk.client.Lang;
import vksdk.client.VkApiClient;
import vksdk.queries.EnumParam;

/**
 * Query builder for API request
 */
abstract class AbstractQueryBuilder(T, R) : ApiRequest!R {

    private string[string] params;

    private string method;

    /**
     * Creates a AbstractQueryBuilder instance that can be used to build api request with various parameters
     *
     * @param client VK API client
     * @param method method name
     * @param type   type of method response
     */
    this(VkApiClient client, string method) {
        super(client.getEndpoint() ~ method, client.getTransportClient());
        this.method = method;
        setVersion(client.getVersion);
    }

    /**
     * Creates a AbstractQueryBuilder instance that can be used to build api request with various parameters
     *
     * @param client   VK API client
     * @param endpoint API endpoint
     * @param method   method name
     * @param type     type of method response
     */
    this(VkApiClient client, string endpoint, string method) {
        super(endpoint ~ method, client.getTransportClient());
        setVersion(client.getVersion);
    }

    /**
     * Convert boolean value to integer flag
     *
     * @param param value
     * @return integer flag
     */
    private static string boolAsParam(bool param) {
        return param ? "1" : "0";
    }

    /**
     * Build request parameter map to query
     *
     * @param params parameters
     * @return string query
     */
    private static string mapToGetString(string[string] params) {
		string result;
		
		foreach (key, value; params) {
			if (result == null) {
				result = "";
			} else {
				result ~= "&";
			}
			
			result ~= key ~ "=" ~ value != null ? value : "";
		}
		
        return result;
    }

    /**
     * Encode request data
     *
     * @param data request data
     * @return encoded data
     */
    private static string escape(string data) {
        return encode(data);
    }

    /**
     * Set access token
     *
     * @param value access token
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    protected T accessToken(string value) {
        return unsafeParam("access_token", value);
    }

    /**
     * Set lang
     *
     * @param value lang
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T lang(Lang value) {
        return unsafeParam("lang", value.getValue());
    }

    /**
     * Set version
     *
     * @param value version
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    protected T setVersion(string value) {
        return unsafeParam("v", value);
    }


    /**
     * Set captcha sid
     *
     * @param value captcha sid
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T captchaSid(string value) {
        return unsafeParam("captcha_sid", value);
    }

    /**
     * Set captcha key
     *
     * @param value captcha key
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T captchaKey(string value) {
        return unsafeParam("captcha_key", value);
    }

    /**
     * Set confirmation
     *
     * @param value confirm
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T confirm(bool value) {
        return unsafeParam("confirm", value);
    }


    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, string value) {
        params[key] = value;
        return getThis();
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, int value) {
        return unsafeParam(key, to!string(value));
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, bool value) {
        return unsafeParam(key, boolAsParam(value));
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, T[] values) {
		string resValue = null;
		foreach (value; values) {
			if (resValue == null) {
				resValue = "";
			} else {
				resValue ~= ",";
			}
			
			resValue ~= value.toString;
		}
		
        return unsafeParam(key, resValue);
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(A...)(string key, A values) pure @safe nothrow {
		A[] resValue;
		foreach (value; values) {
			resValue ~= value;
		}
		
        return unsafeParam(key, resValue);
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, int[] values) {
		string resValue = null;
		foreach (value; values) {
			if (resValue == null) {
				resValue = "";
			} else {
				resValue ~= ",";
			}
			
			resValue ~= value;
		}
		
        return unsafeParam(key, resValue);
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, double value) {
        return unsafeParam(key, to!string(value));
    }

    /**
     * Set parameter
     *
     * @param key   name of parameter
     * @param value value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, EnumParam value) {
        return unsafeParam(key, value.getValue());
    }

    /**
     * Set parameter
     *
     * @param key    name of parameter
     * @param fields value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(A...)(string key, EnumParam[] fields) {
		String resValue = null;
		foreach (field; fields) {
			if (resValue == null) {
				resValue = "";
			} else {
				resValue ~= ",";
			}
			
			resValue ~= field.getValue;
		}
		
        return unsafeParam(key, resValue);
    }

    /**
     * Set parameter
     *
     * @param key    name of parameter
     * @param fields value of parameter
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    T unsafeParam(string key, EnumParam[] fields) {
		string resValue = null;
		foreach (field; fields) {
			if (resValue == null) {
				resValue = "";
			} else {
				resValue ~= ",";
			}
			
			resValue ~= field.getValue;
		}
		
        return unsafeParam(key, resValue);
    }

    override
    protected string getBody() {
        return mapToGetString(build());
    }

    /**
     * Get reference to this object
     *
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    protected abstract T getThis();

    /**
     * Get list of required parameter names
     *
     * @return list of names
     */
    protected abstract string[] essentialKeys();

    /**
     * Get map of parameter values
     *
     * @return map of values
     */
    string[string] build() {
		import std.algorithm;
		import std.conv;

		// TODO remove
		// if (!params.keySet().containsAll(essentialKeys())) {
		
		if (params.keys.all!(a => essentialKeys().canFind(a))) {
			throw new Exception("Not all the keys are passed: essential keys are " ~to!string(essentialKeys()));
		}
		//all!"a > 0"([1, 2, 3, 4]) 
		//if (essentialKeys().all(a => params.canFind(a))) {
		//	throw new Exception("Not all the keys are passed: essential keys are " ~ essentialKeys());
		//}

        return params.dup;
    }

    /**
     * Get method name
     *
     * @return method name
     */
    string getMethod() {
        return method;
    }
}
