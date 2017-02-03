module vksdk.objects.audio.AudioFull;

import vksdk.objects.base.BoolInt;

import vibe.data.json;

/**
 * AudioFull object
 */
class AudioFull : Audio {
    /**
     * Duration in seconds
     */
    @name("duration")
    private int duration;

    /**
     * Date when uploaded
     */
    @name("date")
    private int date;

    /**
     * Album ID
     */
    @name("album_id")
    private int albumId;

    /**
     * Lyrics ID
     */
    @name("lyrics_id")
    private int lyricsId;

    /**
     * Genre ID
     */
    @name("genre_id")
    private int genreId;

    /**
     * Information whether the audio is hidden from search
     */
    @name("no_search")
    private BoolInt noSearch;

    int getDuration() {
        return duration;
    }

    int getDate() {
        return date;
    }

    int getAlbumId() {
        return albumId;
    }

    int getLyricsId() {
        return lyricsId;
    }

    int getGenreId() {
        return genreId;
    }

    bool isNoSearch() {
        return noSearch == BoolInt.YES;
    }
}