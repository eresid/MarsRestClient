module vksdk.objects.audio.Lyrics;

import vibe.data.json;

/**
 * Lyrics object
 */
public class Lyrics {
    /**
     * Lyrics ID
     */
    @name("lyrics_id")
    private int lyricsId;

    /**
     * Lyrics text
     */
    @name("text")
    private string text;

    public int getLyricsId() {
        return lyricsId;
    }

    public string getText() {
        return text;
    }
}