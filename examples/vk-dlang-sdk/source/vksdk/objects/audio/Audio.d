module vksdk.objects.audio.Audio;

import vibe.data.json;

/**
 * Audio object
 */
class Audio {
    /**
     * Audio ID
     */
    @name("id")
    private int id;

    /**
     * Audio owner's ID
     */
    @name("owner_id")
    private int ownerId;

    /**
     * Artist name
     */
    @name("artist")
    private string artist;

    /**
     * Title
     */
    @name("title")
    private string title;

    /**
     * URL of mp3 file
     */
    @name("url")
    private string url;

    /**
     * Access key for the audio
     */
    @name("access_key")
    private string accessKey;

    int getId() {
        return id;
    }

    int getOwnerId() {
        return ownerId;
    }

    string getArtist() {
        return artist;
    }

    string getTitle() {
        return title;
    }

    string getUrl() {
        return url;
    }

    string getAccessKey() {
        return accessKey;
    }
}