namespace Application {
public class Player : Object {

    private Items items = Items.get_instance ();
    string[] inventory = {};
    private Location current_location;

    public string[] show_inventory () {
        return this.inventory;
    }

    public void pickup_item (string input) {
        foreach (Item item in items.get_list ()) {
            if ( input.contains (item.get_tag ())) {
                inventory += item.get_tag ();
                break;
            }
        }
    }

    public void set_current_location (Location current_location) {
        this.current_location = current_location;
    }

    public Location get_current_location () {
        return current_location;
    }

    public bool is_in_location (Location location) {
        return location.get_tag () == current_location.get_tag ();
    }

    public bool can_move_to_location (string input) {
        foreach (string connected_location in current_location.get_connected_locations ()) {
            if ( input.contains (connected_location)) {
                return true;
            }
        }
        return false;
    }
}
}
