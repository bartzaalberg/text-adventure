namespace Application {
public class Player : Object {

    private Items items = Items.get_instance ();
    private Locations locations = Locations.get_instance ();

    static Player? instance;

    Player () {
    }

    public static Player get_instance () {
        if (instance == null) {
            instance = new Player ();
        }
        return instance;
    }

    string[] inventory = {};
    private Location current_location;
    private string horse_name;

    public string[] show_inventory () {
        return this.inventory;
    }

    public string get_horse_name () {
        return this.horse_name;
    }

    public void set_horse_name (string horse_name) {
        this.horse_name = horse_name;
    }

    public void pickup (string input) {
        if (!current_location.contains_item (input)) {
            stdout.printf ("The item isn't here\n");
            return;
        }

        foreach (Item item in items.get_list ()) {
            if ( input.contains (item.get_tag ())) {
                inventory += item.get_tag ();
                break;
            }
        }

        stdout.printf ("The item is in your inventory\n");
    }

    public void look (string input) {
        if (current_location.get_tag () == "hole") {
            stdout.printf ("It's too dark to see.\n");
            return;
        }

        if (input.contains ("around")) {
            stdout.printf ("You are %s.\n", current_location.get_description ());
            return;
        }
        stdout.printf ("I don't understand what you want to see.\n");
    }

    public void go (string input) {
        var location = locations.get_location_by_input (input);

        if (location == null) {
            stdout.printf ("I don't understand where you want to go.\n");
            return;
        }

        if (this.is_in_location (location)) {
            stdout.printf ("You are already here\n");
            return;
        }

        if ( !this.can_move_to_location (location)) {
            stdout.printf ("You cant go there from here\n");
            return;
        }

        this.set_current_location (location);
        this.look ("around");
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

    public bool can_move_to_location (Location location) {
        foreach (string connected_location in current_location.get_connected_locations ()) {
            if ( location.get_tag ().contains (connected_location)) {
                return true;
            }
        }
        return false;
    }
}
}
