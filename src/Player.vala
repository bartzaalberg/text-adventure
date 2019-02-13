namespace Application {
public class Player : Object {

    private Items items = Items.get_instance ();
    private Locations locations = Locations.get_instance ();

    static Player? instance;

    Item? helmet = null;
    Item? chest = null;
    Item? pants = null;
    Item? weapon = null;


    Player () {
    }

    public static Player get_instance () {
        if (instance == null) {
            instance = new Player ();
        }
        return instance;
    }

    Item[] inventory = {};
    private Location current_location;
    private string horse_name;

    public Item[] show_inventory () {
        return this.inventory;
    }

    public string get_horse_name () {
        return this.horse_name;
    }

    public void set_horse_name (string horse_name) {
        this.horse_name = horse_name;
    }

    public Item get_helmet () {
        return this.helmet;
    }

    public void set_helmet (Item item) {
        this.helmet = item;
    }

    public Item get_chest () {
        return this.chest;
    }

    public void set_chest (Item item) {
        this.chest = item;
    }

    public Item get_pants () {
        return this.pants;
    }

    public void set_pants (Item item) {
        this.pants = item;
    }

    public Item get_weapon () {
        return this.weapon;
    }

    public void set_weapon (Item item) {
        this.weapon = item;
    }

    public void pickup (string input) {
        if (!current_location.contains_item (input)) {
            stdout.printf ("The item isn't here\n");
            return;
        }

        foreach (Item item in items.get_list ()) {
            if ( !input.contains (item.get_tag ())) {
                continue;
            }
            inventory += item;
            stdout.printf ("The " + Constants.item (item.get_tag ()) +" was added to your inventory\n");
            return;
        }
    }

    public void equip (string input) {
        foreach (Item item in this.show_inventory ()) {
            if ( !input.contains (item.get_tag ())) {
                continue;
            }
            if ( !item.is_equipable ()) {
                stdout.printf("The " + Constants.item(item.get_tag()) + " is not equipable\n");
                return;
            }

            if(item.get_item_type() == "helmet") {
                this.set_helmet(item);
            }

            if(item.get_item_type() == "chest") {
                this.set_chest(item);
            }

            if(item.get_item_type() == "pants") {
                this.set_pants(item);
            }

            if(item.get_item_type() == "weapon") {
                this.set_weapon(item);
            }

            stdout.printf(Constants.item(item.get_tag ()) + " equipped\n");
            return;
        }

        stdout.printf ("You don't have this item\n");
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
