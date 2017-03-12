module fcm.AbstractService;

import fcm.FCMRequest;
import fcm.FCMResponse;

abstract class AbstractService {

	protected string serverApiKey;

	this(string key) {
		serverApiKey = key;
	}

	abstract FCMResponse request(FCMRequest request);
}
