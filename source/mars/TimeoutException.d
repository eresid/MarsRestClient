module mars.TimeoutException;

import mars.StatusCode;

class TimeoutException : Exception {

	this(string url) {
		super("Timeout exception: " ~ url);
	}
}
