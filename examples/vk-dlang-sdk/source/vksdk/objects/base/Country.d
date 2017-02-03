module vksdk.objects.base.Country;

import vibe.data.json;

/**
 * Country object
 */
class Country {

    /**
     * Country ID
     */
    @name("id")
    private int id;

    /**
     * Country title
     */
    @name("title")
    private string title;

    int getId() {
        return id;
    }

    string getTitle() {
        return title;
    }
}