module vksdk.actions.Users;

import vksdk.client.AbstractAction;
import vksdk.client.VkApiClient;
import vksdk.client.actors.UserActor;
/*import vksdk.queries.users.UserField;
import vksdk.queries.users.UsersGetFollowersQuery;
import vksdk.queries.users.UsersGetFollowersQueryWithFields;
import vksdk.queries.users.UsersGetNearbyQuery;*/
import vksdk.queries.users.UsersGetQuery;
/*import vksdk.queries.users.UsersGetSubscriptionsQuery;
import vksdk.queries.users.UsersGetSubscriptionsQueryWithExtended;
import vksdk.queries.users.UsersIsAppUserQuery;
import vksdk.queries.users.UsersReportQuery;
import vksdk.queries.users.UsersReportType;
import vksdk.queries.users.UsersSearchQuery;*/

/**
 * List of Users methods
 */
class Users : AbstractAction {

	/**
     * Constructor
     *
     * @param client vk api client
     */
	this(VkApiClient client) {
		super(client);
	}


    /**
     * Returns detailed information on users.
     */
    UsersGetQuery get() {
        return new UsersGetQuery(getClient());
    }
/++
    /**
     * Returns detailed information on users.
     */
    UsersGetQuery get(UserActor actor) {
        return new UsersGetQuery(getClient(), actor);
    }

    /**
     * Returns a list of users matching the search criteria.
     */
    UsersSearchQuery search(UserActor actor) {
        return new UsersSearchQuery(getClient(), actor);
    }

    /**
     * Returns information whether a user installed the application.
     */
    UsersIsAppUserQuery isAppUser(UserActor actor) {
        return new UsersIsAppUserQuery(getClient(), actor);
    }

    /**
     * Returns a list of IDs of users and communities followed by the user.
     */
    UsersGetSubscriptionsQuery getSubscriptions() {
        return new UsersGetSubscriptionsQuery(getClient());
    }

    /**
     * Returns a list of IDs of users and communities followed by the user.
     */
    UsersGetSubscriptionsQuery getSubscriptions(UserActor actor) {
        return new UsersGetSubscriptionsQuery(getClient(), actor);
    }

    /**
     * Returns a list of IDs of users and communities followed by the user.
     */
    UsersGetSubscriptionsQueryWithExtended getSubscriptionsExtended() {
        return new UsersGetSubscriptionsQueryWithExtended(getClient());
    }

    /**
     * Returns a list of IDs of users and communities followed by the user.
     */
    UsersGetSubscriptionsQueryWithExtended getSubscriptionsExtended(UserActor actor) {
        return new UsersGetSubscriptionsQueryWithExtended(getClient(), actor);
    }

    /**
     * Returns a list of IDs of followers of the user in question, sorted by date added, most recent first.
     */
    UsersGetFollowersQuery getFollowers() {
        return new UsersGetFollowersQuery(getClient());
    }

    /**
     * Returns a list of IDs of followers of the user in question, sorted by date added, most recent first.
     */
    UsersGetFollowersQuery getFollowers(UserActor actor) {
        return new UsersGetFollowersQuery(getClient(), actor);
    }

    /**
     * Returns a list of IDs of followers of the user in question, sorted by date added, most recent first.
     */
    UsersGetFollowersQueryWithFields getFollowers(UserField...)(UserField fields) {
        return new UsersGetFollowersQueryWithFields(getClient(), fields);
    }

    /**
     * Returns a list of IDs of followers of the user in question, sorted by date added, most recent first.
     */
    UsersGetFollowersQueryWithFields getFollowers(UserField[] fields) {
        return new UsersGetFollowersQueryWithFields(getClient(), fields);
    }

    /**
     * Returns a list of IDs of followers of the user in question, sorted by date added, most recent first.
     */
    UsersGetFollowersQueryWithFields getFollowers(T, A...)(UserActor actor, UserField fields) {
        return new UsersGetFollowersQueryWithFields(getClient(), actor, fields);
    }

    /**
     * Returns a list of IDs of followers of the user in question, sorted by date added, most recent first.
     */
    UsersGetFollowersQueryWithFields getFollowers(UserActor actor, UserField[] fields) {
        return new UsersGetFollowersQueryWithFields(getClient(), actor, fields);
    }

    /**
     * Reports (submits a complain about) a user.
     */
    UsersReportQuery report(UserActor actor, int userId, UsersReportType type) {
        return new UsersReportQuery(getClient(), actor, userId, type);
    }

    /**
     * Indexes current user location and returns nearby users.
     */
    UsersGetNearbyQuery getNearby(UserActor actor, float latitude, float longitude) {
        return new UsersGetNearbyQuery(getClient(), actor, latitude, longitude);
    }++/
}
