module vksdk.objects.base.BaseObject;

/**
 * BaseObject object
 */
public class BaseObject {

    /**
     * Object ID
     */
    @name("id")
    private int id;

    /**
     * Object title
     */
    @name("title")
    private string title;

    public int getId() {
        return id;
    }

    public string getTitle() {
        return title;
    }
}