module vksdk.objects.users.UserCounters;

/**
 * UserCounters object
 */
class UserCounters {
    /**
     * Albums number
     */
    @name("albums")
    private int albums;

    /**
     * Videos number
     */
    @name("videos")
    private int videos;

    /**
     * Audios number
     */
    @name("audios")
    private int audios;

    /**
     * Notes number
     */
    @name("notes")
    private int notes;

    /**
     * Photos number
     */
    @name("photos")
    private int photos;

    /**
     * Communities number
     */
    @name("groups")
    private int groups;

    /**
     * Gifts number
     */
    @name("gifts")
    private int gifts;

    /**
     * Friends number
     */
    @name("friends")
    private int friends;

    /**
     * Online friends number
     */
    @name("online_friends")
    private int onlineFriends;

    /**
     * Number of photos with user
     */
    @name("user_photos")
    private int userPhotos;

    /**
     * Number of videos with user
     */
    @name("user_videos")
    private int userVideos;

    /**
     * Followers number
     */
    @name("followers")
    private int followers;

    /**
     * Subscriptions number
     */
    @name("subscriptions")
    private int subscriptions;

    /**
     * pages number
     */
    @name("pages")
    private int pages;

    int getAlbums() {
        return albums;
    }

    int getVideos() {
        return videos;
    }

    int getAudios() {
        return audios;
    }

    int getNotes() {
        return notes;
    }

    int getPhotos() {
        return photos;
    }

    int getGroups() {
        return groups;
    }

    int getGifts() {
        return gifts;
    }

    int getFriends() {
        return friends;
    }

    int getOnlineFriends() {
        return onlineFriends;
    }

    int getUserPhotos() {
        return userPhotos;
    }

    int getUserVideos() {
        return userVideos;
    }

    int getFollowers() {
        return followers;
    }

    int getSubscriptions() {
        return subscriptions;
    }

    int getPages() {
        return pages;
    }
}