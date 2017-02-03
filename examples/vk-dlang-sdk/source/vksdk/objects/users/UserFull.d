module vksdk.objects.users.UserFull;

import vksdk.objects.audio.AudioFull;
import vksdk.objects.base.BaseObject;
import vksdk.objects.base.BoolInt;
import vksdk.objects.base.Country;

import vibe.data.json;

/**
 * UserFull object
 */
class UserFull : User {

    /**
     * User nickname
     */
    @name("nickname")
    private string nickname;

    /**
     * User maiden name
     */
    @name("maiden_name")
    private string maidenName;

    /**
     * Domain name of the user's page
     */
    @name("domain")
    private string domain;

    /**
     * User's date of birth
     */
    @name("bdate")
    private string bdate;

    @name("city")
    private BaseObject city;

    @name("country")
    private Country country;

    /**
     * User's timezone
     */
    @name("timezone")
    private int timezone;

    /**
     * URL of square photo of the user with 200 pixels in width
     */
    @name("photo_200")
    private string photo200;

    /**
     * URL of square photo of the user with maximum width
     */
    @name("photo_max")
    private string photoMax;

    /**
     * URL of user's photo with 200 pixels in width
     */
    @name("photo_200_orig")
    private string photo200Orig;

    /**
     * URL of user's photo with 400 pixels in width
     */
    @name("photo_400_orig")
    private string photo400Orig;

    /**
     * URL of user's photo of maximum size
     */
    @name("photo_max_orig")
    private string photoMaxOrig;

    /**
     * ID of the user's main photo
     */
    @name("photo_id")
    private string photoId;

    /**
     * Information whether the user has main photo
     */
    @name("has_photo")
    private BoolInt hasPhoto;

    /**
     * Information whether the user specified his phone number
     */
    @name("has_mobile")
    private BoolInt hasMobile;

    /**
     * Information whether the user is a friend of current user
     */
    @name("is_friend")
    private BoolInt isFriend;

    /**
     * Friend status for current user
     */
    @name("friend_status")
    private int friendStatus;

    /**
     * Information whether current user can comment wall posts
     */
    @name("wall_comments")
    private BoolInt wallComments;

    /**
     * Information whether current user can post on the user's wall
     */
    @name("can_post")
    private BoolInt canPost;

    /**
     * Information whether current user can see other users' audio on the wall
     */
    @name("can_see_all_posts")
    private BoolInt canSeeAllPosts;

    /**
     * Information whether current user can see the user's audio
     */
    @name("can_see_audio")
    private BoolInt canSeeAudio;

    /**
     * Information whether current user can write private message
     */
    @name("can_write_private_message")
    private BoolInt canWritePrivateMessage;

    /**
     * Information whether current user can send a friend request
     */
    @name("can_send_friend_request")
    private BoolInt canSendFriendRequest;

    /**
     * Information whether current user can see
     */
    @name("mobile_phone")
    private string mobilePhone;

    /**
     * User's mobile phone number
     */
    @name("home_phone")
    private string homePhone;

    /**
     * User's Skype nickname
     */
    @name("skype")
    private string skype;

    /**
     * User's Facebook account
     */
    @name("facebook")
    private string facebook;

    /**
     * User's Facebook name
     */
    @name("facebook_name")
    private string facebookName;

    /**
     * User's Twitter account
     */
    @name("twitter")
    private string twitter;

    /**
     * User's Livejournal account
     */
    @name("livejournal")
    private string livejournal;

    /**
     * User's Instagram account
     */
    @name("instagram")
    private string instagram;

    /**
     * User's website
     */
    @name("site")
    private string site;

    @name("status_audio")
    private AudioFull statusAudio;

    /**
     * User's status
     */
    @name("status")
    private string status;

    /**
     * User's status
     */
    @name("activity")
    private string activity;

    @name("last_seen")
    private LastSeen lastSeen;

    @name("exports")
    private Exports exports;

    @name("crop_photo")
    private CropPhoto cropPhoto;

    /**
     * Information whether the user is verified
     */
    @name("verified")
    private BoolInt verified;

    /**
     * Number of user's followers
     */
    @name("followers_count")
    private int followersCount;

    /**
     * Information whether current user is in the requested user's blacklist.
     */
    @name("blacklisted")
    private BoolInt blacklisted;

    /**
     * Information whether the requested user is in current user's blacklist
     */
    @name("blacklisted_by_me")
    private BoolInt blacklistedByMe;

    /**
     * Information whether the requested user is in faves of current user
     */
    @name("is_favorite")
    private BoolInt isFavorite;

    /**
     * Information whether the requested user is hidden from current user's newsfeed
     */
    @name("is_hidden_from_feed")
    private BoolInt isHiddenFromFeed;

    /**
     * Number of common friends with current user
     */
    @name("common_count")
    private int commonCount;

    @name("occupation")
    private Occupation occupation;

    @name("career")
    private Career[] career;

    @name("military")
    private Military[] military;

    /**
     * University ID
     */
    @name("university")
    private int university;

    /**
     * University name
     */
    @name("university_name")
    private string universityName;

    /**
     * Faculty ID
     */
    @name("faculty")
    private int faculty;

    /**
     * Faculty name
     */
    @name("faculty_name")
    private string facultyName;

    /**
     * Graduation year
     */
    @name("graduation")
    private int graduation;

    /**
     * Education form
     */
    @name("education_form")
    private string educationForm;

    /**
     * User's education status
     */
    @name("education_status")
    private string educationStatus;

    /**
     * User hometown
     */
    @name("home_town")
    private string homeTown;

    /**
     * User relationship status
     */
    @name("relation")
    private int relation;

    @name("relation_partner")
    private UserMin relationPartner;

    @name("personal")
    private Personal personal;

    /**
     * User's interests
     */
    @name("interests")
    private string interests;

    /**
     * User's favorite music
     */
    @name("music")
    private string music;

    /**
     * User's activities
     */
    @name("activities")
    private string activities;

    /**
     * User's favorite movies
     */
    @name("movies")
    private string movies;

    /**
     * User's favorite tv shows
     */
    @name("tv")
    private string tv;

    /**
     * User's favorite books
     */
    @name("books")
    private string books;

    /**
     * User's favorite games
     */
    @name("games")
    private string games;

    @name("universities")
    private University[] universities;

    @name("schools")
    private School[] schools;

    /**
     * About me field
     */
    @name("about")
    private string about;

    @name("relatives")
    private Relative[] relatives;

    /**
     * Favorite quotes
     */
    @name("quotes")
    private string quotes;

    string getNickname() {
        return nickname;
    }

    string getMaidenName() {
        return maidenName;
    }

    string getDomain() {
        return domain;
    }

    string getBdate() {
        return bdate;
    }

    BaseObject getCity() {
        return city;
    }

    Country getCountry() {
        return country;
    }

    int getTimezone() {
        return timezone;
    }

    string getPhoto200() {
        return photo200;
    }

    string getPhotoMax() {
        return photoMax;
    }

    string getPhoto200Orig() {
        return photo200Orig;
    }

    string getPhoto400Orig() {
        return photo400Orig;
    }

    string getPhotoMaxOrig() {
        return photoMaxOrig;
    }

    string getPhotoId() {
        return photoId;
    }

    bool hasPhoto() {
        return hasPhoto == BoolInt.YES;
    }

    bool isHasMobile() {
        return hasMobile == BoolInt.YES;
    }

    bool isIsFriend() {
        return isFriend == BoolInt.YES;
    }

    int getFriendStatus() {
        return friendStatus;
    }

    bool isWallComments() {
        return wallComments == BoolInt.YES;
    }

    bool canPost() {
        return canPost == BoolInt.YES;
    }

    bool canSeeAllPosts() {
        return canSeeAllPosts == BoolInt.YES;
    }

    bool canSeeAudio() {
        return canSeeAudio == BoolInt.YES;
    }

    bool canWritePrivateMessage() {
        return canWritePrivateMessage == BoolInt.YES;
    }

    bool canSendFriendRequest() {
        return canSendFriendRequest == BoolInt.YES;
    }

    string getMobilePhone() {
        return mobilePhone;
    }

    string getHomePhone() {
        return homePhone;
    }

    string getSkype() {
        return skype;
    }

    string getFacebook() {
        return facebook;
    }

    string getFacebookName() {
        return facebookName;
    }

    string getTwitter() {
        return twitter;
    }

    string getLivejournal() {
        return livejournal;
    }

    string getInstagram() {
        return instagram;
    }

    string getSite() {
        return site;
    }

    AudioFull getStatusAudio() {
        return statusAudio;
    }

    string getStatus() {
        return status;
    }

    string getActivity() {
        return activity;
    }

    LastSeen getLastSeen() {
        return lastSeen;
    }

    Exports getExports() {
        return exports;
    }

    CropPhoto getCropPhoto() {
        return cropPhoto;
    }

    bool isVerified() {
        return verified == BoolInt.YES;
    }

    int getFollowersCount() {
        return followersCount;
    }

    bool isBlacklisted() {
        return blacklisted == BoolInt.YES;
    }

    bool isBlacklistedByMe() {
        return blacklistedByMe == BoolInt.YES;
    }

    bool isIsFavorite() {
        return isFavorite == BoolInt.YES;
    }

    bool isIsHiddenFromFeed() {
        return isHiddenFromFeed == BoolInt.YES;
    }

    int getCommonCount() {
        return commonCount;
    }

    Occupation getOccupation() {
        return occupation;
    }

    Career[] getCareer() {
        return career;
    }

    Military[] getMilitary() {
        return military;
    }

    int getUniversity() {
        return university;
    }

    string getUniversityName() {
        return universityName;
    }

    int getFaculty() {
        return faculty;
    }

    string getFacultyName() {
        return facultyName;
    }

    int getGraduation() {
        return graduation;
    }

    string getEducationForm() {
        return educationForm;
    }

    string getEducationStatus() {
        return educationStatus;
    }

    string getHomeTown() {
        return homeTown;
    }

    int getRelation() {
        return relation;
    }

    UserMin getRelationPartner() {
        return relationPartner;
    }

    Personal getPersonal() {
        return personal;
    }

    string getInterests() {
        return interests;
    }

    string getMusic() {
        return music;
    }

    string getActivities() {
        return activities;
    }

    string getMovies() {
        return movies;
    }

    string getTv() {
        return tv;
    }

    string getBooks() {
        return books;
    }

    string getGames() {
        return games;
    }

    University[] getUniversities() {
        return universities;
    }

    School[] getSchools() {
        return schools;
    }

    string getAbout() {
        return about;
    }

    Relative[] getRelatives() {
        return relatives;
    }

    string getQuotes() {
        return quotes;
    }
}