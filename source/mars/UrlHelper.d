module mars.UrlHelper;

import std.algorithm.searching;
import std.exception;

version(unittest) {
	import std.stdio;
}

import mars.RequestParams;

class UrlHelper {

	static string createUrl(string baseUrl, string requestUrl, string[string] urlParams, RequestParams params) {
		enforce(requestUrl !is null, new Exception("Cannot get request Url!"));

        string finalUrl;

		if (requestUrl.startsWith("http")) {
			finalUrl = addArgsIfNeed(requestUrl, params);
		}

		enforce(baseUrl !is null, new Exception("Cannot get base Url!"));

		finalUrl = baseUrl ~ addArgsIfNeed(requestUrl, params);

		if (urlParams !is null && urlParams.length > 0) {
            finalUrl = setUrlParams(finalUrl, urlParams);
		}

		return finalUrl;
	}

	private static string setUrlParams(string url, string[string] urlParams) {
	    // TODO
        return url;
	}

	private static string addArgsIfNeed(string url, RequestParams params) {
		if (params is null || params.getParams.length == 0) {
			return url;
		}

		import std.string;
		import std.algorithm.iteration;

		string[string] args = params.getParams;

		string urlParams = args.keys.map!(k => k ~ "=" ~ args[k]).join("&");
		if (canFind(url, "?")) {
			url = url ~ "&" ~ urlParams;
		} else {
			url = url ~ "?" ~ urlParams;
		}

		return url;
	}
}

unittest {
	try {
		UrlHelper.createUrl(null, null, null);
		assert(false);
	} catch (Exception e) {
		writeln(e.msg);
		assert(e !is null);
		assert(e.msg == "Cannot get request Url!");
	}
}
