module org.dinipra.fcm.FCMResponse;

import vibe.data.json;

/**
 * Downstream HTTP message response body (JSON).
 * 
 * https://firebase.google.com/docs/cloud-messaging/http-server-ref#table5
 */
struct FCMResponse
{
	/**
	 * Unique ID (number) identifying the multicast message.
	 */
	@name("multicast_id")
	real multicastId;
	
	/**
	 * Number of messages that were processed without an error.
	 */
	@name("success")
	int success;

	/**
	 * Number of messages that could not be processed.
	 */
	@name("failure")
	int failure;
	
	/**
	 * Number of results that contain a canonical registration token.
	 * A canonical registration ID is the registration token of the
	 * last registration requested by the client app. This is the ID
	 * that the server should use when sending messages to the device.
	 */
	@name("canonical_ids")
	int canonicalIds;

	/**
	 * Array of objects representing the status of the messages
	 * processed. The objects are listed in the same order as the
	 * request (i.e., for each registration ID in the request, its
	 * result is listed in the same index in the response).
	 */
	@name("results")
	Result[] results;
	
	struct Result
	{
		/**
		 * String specifying a unique ID for each successfully
		 * processed message.
		 */
		@optional
		@name("message_id")
		string messageId;
		
		/**
		 * Optional string specifying the canonical registration token
		 * for the client app that the message was processed and sent
		 * to. Sender should use this value as the registration token
		 * for future requests. Otherwise, the messages might be
		 * rejected.
		 * 
		 * Optional
		 */
		@optional
		@name("registration_id")
		string registrationId;
		
		/**
		 * String specifying the error that occurred when processing
		 * the message for the recipient. The possible values can be
		 * found in:
		 * https://firebase.google.com/docs/cloud-messaging/http-server-ref#table9
		 */
		@optional
		@name("error")
		string error;
	}
}
