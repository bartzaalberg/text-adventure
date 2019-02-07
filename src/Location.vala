namespace Application {
public class Location : Object {

    private string tag;
    private string description;
    string[] connected_locations;

    public Location (string tag, string description, string[] connected_locations) {
        this.tag = tag;
        this.description = description;
        this.connected_locations = connected_locations;
    }

    public string get_tag () {
        return this.tag;
    }

    public string get_description () {
        return this.description;
    }

    public string[] get_connected_locations () {
        return this.connected_locations;
    }
}
}
