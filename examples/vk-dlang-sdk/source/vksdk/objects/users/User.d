module vksdk.objects.users.User;

import vksdk.objects.base.BoolInt;
import vksdk.objects.base.Sex;
import vksdk.objects.users.UserMin;

import vibe.data.json;

/**
 * User object
 */
class User : UserMin {

    /**
     * User sex
     */
    @name("sex")
    private Sex sex;

    /**
     * Domain name of the user's page
     */
    @name("screen_name")
    private string screenName;

    /**
     * URL of square photo of the user with 50 pixels in width
     */
    @name("photo_50")
    private string photo50;

    /**
     * URL of square photo of the user with 100 pixels in width
     */
    @name("photo_100")
    private string photo100;

    /**
     * Information whether the user is online
     */
    @name("online")
    private BoolInt online;

    /**
     * Information whether the user is online in mobile site or application
     */
    @name("online_mobile")
    private BoolInt onlineMobile;

    /**
     * Application ID
     */
    @name("online_app")
    private int onlineApp;

    Sex getSex() {
        return sex;
    }

    string getScreenName() {
        return screenName;
    }

    string getPhoto50() {
        return photo50;
    }

    string getPhoto100() {
        return photo100;
    }

    bool isOnline() {
        return online == BoolInt.YES;
    }

    bool isOnlineMobile() {
        return online == BoolInt.YES;
    }

    int getOnlineApp() {
        return onlineApp;
    }
}