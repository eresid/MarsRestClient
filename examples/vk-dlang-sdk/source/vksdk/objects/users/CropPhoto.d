module vksdk.objects.users.CropPhoto;

import vibe.data.json;

/**
 * CropPhoto object
 */
class CropPhoto {

    @name("photo")
    private Photo photo;

    @name("crop")
    private Json crop;

    @name("rect")
    private Json rect;

    Photo getPhoto() {
        return photo;
    }

    Json getCrop() {
        return crop;
    }

    Json getRect() {
        return rect;
    }
}