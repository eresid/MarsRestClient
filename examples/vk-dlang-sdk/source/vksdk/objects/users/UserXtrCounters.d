module vksdk.objects.users.UserXtrCounters;

import vibe.data.json;

import vksdk.objects.users.UserFull;

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