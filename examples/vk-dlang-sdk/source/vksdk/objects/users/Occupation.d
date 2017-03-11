module vksdk.objects.users.Occupation;

/**
 * Occupation object
 */
class Occupation {
    /**
     * Type of occupation
     */
    @name("type")
    private string type;

    /**
     * ID of school, university, company group
     */
    @name("id")
    private int id;

    /**
     * Name of occupation
     */
    @name("name")
    private string name;

    string getType() {
        return type;
    }

    int getId() {
        return id;
    }

    string getName() {
        return name;
    }
}