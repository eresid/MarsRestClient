module vksdk.objects.users.LastSeen;

import vibe.data.json;

/**
 * LastSeen object
 */
class LastSeen {
    /**
     * Last visit date (in Unix time)
     */
    @name("time")
    private int time;

    /**
     * Type of the platform that used for the last authorization
     */
    @name("platform")
    private int platform;

    int getTime() {
        return time;
    }

    int getPlatform() {
        return platform;
    }
}