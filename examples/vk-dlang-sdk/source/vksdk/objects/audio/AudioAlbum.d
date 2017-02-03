module vksdk.objects.audio.AudioAlbum;

import vibe.data.json;

/**
 * AudioAlbum object
 */
class AudioAlbum {
    /**
     * Album ID
     */
    @name("id")
    private int id;

    /**
     * Album owner's ID
     */
    @name("owner_id")
    private int ownerId;

    /**
     * Album title
     */
    @name("title")
    private string title;

    int getId() {
        return id;
    }

    int getOwnerId() {
        return ownerId;
    }

    string getTitle() {
        return title;
    }
}