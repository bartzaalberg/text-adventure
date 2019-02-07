namespace Application {
public class Location : Object {

    private string tag;
    private string description;

    public Location (string tag, string description) {
        this.tag = tag;
        this.description = description;
    }

    public string get_tag () {
        return this.tag;
    }

    public string get_description () {
        return this.description;
    }
}
}
