module mars.UrlHelper;

import std.algorithm.searching;
import std.exception;

version(unittest) {
	import std.stdio;
}

import mars.RequestParams;

class UrlHelper {

	static string createUrl(string baseUrl, string requestUrl, RequestParams params) {
		enforce(requestUrl !is null, new Exception("Cannot get request Url!"));

		if (requestUrl.startsWith("http")) {
			return addArgsIfNeed(requestUrl, params);
		}

		enforce(baseUrl !is null, new Exception("Cannot get base Url!"));

		return baseUrl ~ addArgsIfNeed(requestUrl, params);
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
