module fcm.FCMRequest;

import std.typecons;

import vibe.data.json;

/**
 * Targets, options, and payload for downstream HTTP messages (JSON).
 * 
 * https://firebase.google.com/docs/cloud-messaging/http-server-ref#table1
 */
struct FCMRequest
{
	// Targets
	
	/**
	 * This parameter specifies the recipient of a message.
	 * 
	 * The value must be a registration token, notification key, or
	 * topic. Do not set this field when sending to multiple topics.
	 * See condition.
	 */
	//@optional
	//@name("to")
	//Nullable!string to;
	
	/**
	 * This parameter specifies a list of devices (registration tokens,
	 * or IDs) receiving a multicast message. It must contain at least
	 * 1 and at most 1000 registration tokens.
	 * 
	 * Use this parameter only for multicast messaging, not for single
	 * recipients. Multicast messages (sending to more than 1
	 * registration tokens) are allowed using HTTP JSON format only.
	 */
	@name("registration_ids")
	string[] registrationIds;

	/**
	 * This parameter specifies a logical expression of conditions that
	 * determine the message target.
	 * 
	 * Supported condition: Topic, formatted as "'yourTopic' in topics".
	 * This value is case-insensitive.
	 * 
	 * Supported operators: &&, ||. Maximum two operators per topic
	 * message supported.
	 */
	//@optional
	//@name("condition")
	//Nullable!string condition;

	/**
	 * This parameter is deprecated. Instead, use to to specify message
	 * recipients. For more information on how to send messages to
	 * multiple devices, see the documentation for your platform.
	 */
	//@optional
	//@name("notification_key")
	//deprecated Nullable!string notificationKey;

	// Options
	
	/**
	 * This parameter identifies a group of messages (e.g., with
	 * collapse_key: "Updates Available") that can be collapsed, so
	 * that only the last message gets sent when delivery can be
	 * resumed. This is intended to avoid sending too many of the
	 * same messages when the device comes back online or becomes
	 * active.
	 * 
	 * Note that there is no guarantee of the order in which messages
	 * get sent.
	 * 
	 * Note: A maximum of 4 different collapse keys is allowed at
	 * any given time. This means a FCM connection server can
	 * simultaneously store 4 different send-to-sync messages per
	 * client app. If you exceed this number, there is no guarantee
	 * which 4 collapse keys the FCM connection server will keep.
	 */
	//@optional
	//@name("collapse_key")
	//Nullable!string collapseKey;

	/**
	 * Sets the priority of the message. Valid values are "normal"
	 * and "high." On iOS, these correspond to APNs priorities 5 and 10.
	 * 
	 * By default, notification messages are sent with high priority,
	 * and data messages are sent with normal priority. Normal priority
	 * optimizes the client app's battery consumption and should be
	 * used unless immediate delivery is required. For messages with
	 * normal priority, the app may receive the message with
	 * unspecified delay.
	 * 
	 * When a message is sent with high priority, it is sent
	 * immediately, and the app can wake a sleeping device and open a
	 * network connection to your server.
	 * 
	 * For more information, see Setting the priority of a message.
	 * 
	 * https://firebase.google.com/docs/cloud-messaging/concept-options#setting-the-priority-of-a-message
	 */
	//@optional
	//@name("priority")
	//Nullable!string priority;
	
	/**
	 * On iOS, use this field to represent content-available in the
	 * APNs payload. When a notification or message is sent and this
	 * is set to true, an inactive client app is awoken. On Android,
	 * data messages wake the app by default. On Chrome, currently not
	 * supported.
	 */
	//@optional
	//@name("content_available")
	//Nullable!bool contentAvailable;
	
	/**
	 * This parameter specifies how long (in seconds) the message
	 * should be kept in FCM storage if the device is offline. The
	 * maximum time to live supported is 4 weeks, and the default
	 * value is 4 weeks. For more information, see Setting the
	 * lifespan of a message.
	 * 
	 * https://firebase.google.com/docs/cloud-messaging/concept-options#ttl
	 */
	//@optional
	//@name("time_to_live")
	//Nullable!int timeToLive;
	
	/**
	 * This parameter specifies the package name of the application
	 * where the registration tokens must match in order to receive
	 * the message.
	 */
	//@optional
	//@name("restricted_package_name")
	//Nullable!string restrictedPackageName;
	
	/**
	 * This parameter, when set to true, allows developers to test a
	 * request without actually sending a message.
	 * 
	 * The default value is false.
	 */
	//@optional
	//@name("dry_run")
	//Nullable!bool dryRun;
	
	// Payload

	/**
	 * This parameter specifies the custom key-value pairs of the
	 * message's payload.
	 * 
	 * For example, with data:{"score":"3x1"}:
	 * 
	 * On iOS, if the message is sent via APNS, it represents the
	 * custom data fields. If it is sent via FCM connection server,
	 * it would be represented as key value dictionary in AppDelegate
	 * application:didReceiveRemoteNotification:.
	 * 
	 * On Android, this would result in an intent extra named score
	 * with the string value 3x1.
	 * 
	 * The key should not be a reserved word ("from" or any word
	 * starting with "google" or "gcm"). Do not use any of the words
	 * defined in this table (such as collapse_key).
	 * 
	 * Values in string types are recommended. You have to convert
	 * values in objects or other non-string data types (e.g.,
	 * integers or booleans) to string.
	 */
	@optional
	@name("data")
	Nullable!Json data;

	/**
	 * This parameter specifies the predefined, user-visible key-value
	 * pairs of the notification payload. See Notification payload
	 * support for detail. For more information about notification
	 * message and data message options, see Payload:
	 * https://firebase.google.com/docs/cloud-messaging/concept-options#notifications_and_data_messages
	 */
	//@optional
	//@name("notification")
	//Nullable!Json notification;
}
