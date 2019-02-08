namespace Application {
public class Location : Object {

    private string tag;
    private string description;
    string[] connected_locations;
    string[] items;

    public Location (
        string tag,
        string description,
        string[] connected_locations,
        string[] items
    ) {
        this.tag = tag;
        this.description = description;
        this.connected_locations = connected_locations;
        this.items = items;
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

    public string[] get_items () {
        return this.items;
    }

    public bool contains_item (string input) {
        foreach (string item in this.items) {
            if ( input.contains (item)) {
                return true;
            }
        }
        return false;
    }
}
}
