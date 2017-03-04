module vksdk.queries.users.UsersGetQuery;

import vksdk.client.AbstractQueryBuilder;
import vksdk.client.VkApiClient;
import vksdk.queries.users.UserField;
import vksdk.objects.users.UserXtrCounters;

/**
 * Query for Users.get method
 */
class UsersGetQuery : AbstractQueryBuilder!(UsersGetQuery, UserXtrCounters[]) {

    /**
     * Creates a AbstractQueryBuilder instance that can be used to build api request with various parameters
     *
     * @param client VK API client
     * @param actor  actor with access token
     */
    this(VkApiClient client, UserActor actor) {
        super(client, "users.get");
        accessToken(actor.getAccessToken());
    }

    /**
     * Creates a AbstractQueryBuilder instance that can be used to build api request with various parameters
     *
     * @param client VK API client
     */
    this(VkApiClient client) {
        super(client, "users.get");
    }

    /**
     * User IDs or screen names ("screen_name"). By default, current user ID.
     *
     * @param value value of "user ids" parameter.
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    UsersGetQuery userIds(A...)(string value) {
        return unsafeParam("user_ids", value);
    }

    /**
     * User IDs or screen names ("screen_name"). By default, current user ID.
     *
     * @param value value of "user ids" parameter.
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    UsersGetQuery userIds(string[] value) {
        return unsafeParam("user_ids", value);
    }

    /**
     * Profile fields to return.
     *
     * @param value value of "fields" parameter.
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    UsersGetQuery fields(A...)(UserField value) {
        return unsafeParam("fields", value);
    }

    /**
     * Profile fields to return.
     *
     * @param value value of "fields" parameter.
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    UsersGetQuery fields(UserField[] value) {
        return unsafeParam("fields", value);
    }

    /**
     * Case for declension of user name and surname
     *
     * @param value value of "name case" parameter.
     * @return a reference to this {@code AbstractQueryBuilder} object to fulfill the "Builder" pattern.
     */
    UsersGetQuery nameCase(UsersNameCase value) {
        return unsafeParam("name_case", value);
    }

    override protected UsersGetQuery getThis() {
        return this;
    }

    override protected string[] essentialKeys() {
        return [];
    }
}