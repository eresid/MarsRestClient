module vksdk.objects.users.UserXtrCounters;

import vibe.data.json;

/**
 * UserXtrCounters object
 */
class UserXtrCounters : UserFull {

    @name("counters")
    private UserCounters counters;

    public UserCounters getCounters() {
        return counters;
    }
}