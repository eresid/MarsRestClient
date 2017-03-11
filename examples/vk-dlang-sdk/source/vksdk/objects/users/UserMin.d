module vksdk.objects.users.UserMin;

import vibe.data.json;

/**
 * UserMin object
 */
class UserMin {
    /**
     * User ID
     */
    @name("id")
    private int id;

    /**
     * User first name
     */
    @name("first_name")
    private string firstName;

    /**
     * User last name
     */
    @name("last_name")
    private string lastName;

    /**
     * Returns if a profile is deleted or blocked
     */
    @name("deactivated")
    private string deactivated;

    /**
     * Returns if a profile is hidden.
     */
    @name("hidden")
    private int hidden;

    int getId() {
        return id;
    }

    string getFirstName() {
        return firstName;
    }

    string getLastName() {
        return lastName;
    }

    string getDeactivated() {
        return deactivated;
    }

    int getHidden() {
        return hidden;
    }
}