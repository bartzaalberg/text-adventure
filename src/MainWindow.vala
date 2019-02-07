namespace Application {
public class MainWindow : Gtk.Window {

    private TextHelper text_helper = new TextHelper ();
    private Player player = new Player ();
    private Location location_of_player;
    Location[] locations = {};
    Item[] items = {};

    construct {
        load_items ();
        load_locations ();
        location_of_player = locations [0];
        text_helper.show_opening_text ();
        execute_look ("around");

        while (true) {
            stdout.printf ("--> ");
            string? input = stdin.read_line ();
            stdout.printf ("\n");

            if ( input.contains ("look")) {
                if (location_of_player.get_tag () == "hole") {
                    stdout.printf ("It's too dark to see.\n");
                    continue;
                }
                execute_look (input);
                continue;
            }
            if ( input.contains ("go")) {
                execute_go (input);
                continue;
            }
            if ( input.contains ("inventory")) {
                text_helper.show_inventory (player);
                continue;
            }
            if ( input.contains ("pickup")) {
                if (!location_contains_item (input)) {
                    stdout.printf ("The item isn't here\n");
                    continue;
                }
                player.pickup_item (input, items);
                stdout.printf ("The item is in your inventorys\n");
                continue;
            }
            if ( input.contains ("quit")) {
                stdout.printf ("\nBye!\n");
                break;
            }

            text_helper.show_help_text ();
        }
        return;
    }

    void load_items () {
        items += new Item ("copper coin");
        items += new Item ("silver coin");
        items += new Item ("torch");
        items += new Item ("straw hat");
    }

    void load_locations () {
        locations += new Location (
            "field",
            "in an open field. There are some coins and a straw hat next too you. You see a cave in the distance",
            {"cave"},
            {"silver coin", "copper coin", "straw hat"}
        );
        locations += new Location (
            "cave",
            "in the cave. The is a flaming torch on the wall. Watch out for the hole..",
            {"cave", "hole"},
            {"torch"}
        );
        locations += new Location (
            "hole",
            "at dark hole.OH NO! You fell in.. its way to dark to see anything here",
            {"hole"},
            {}
        );
    }

    void execute_look (string input) {
        if (input.contains ("around")) {
            stdout.printf ("You are %s.\n", location_of_player.get_description ());
            return;
        }
        stdout.printf ("I don't understand what you want to see.\n");
    }

    void execute_go (string input) {
        foreach (Location location in locations) {
            if ( !(location_in_input (location, input))) {
                continue;
            }
            if (player_is_already_in_location (location)) {
                stdout.printf ("You are already here\n");
                return;
            }
            if ( !(player_can_move_to_location (input))) {
                stdout.printf ("You cant go there from here\n");
                return;
            }
            location_of_player = location;
            execute_look ("around");
            return;
        }
        stdout.printf ("I don't understand where you want to go.\n");
    }

    bool location_in_input (Location location, string input) {
        return input.contains (location.get_tag ());
    }

    bool player_can_move_to_location (string input) {
        foreach (string connected_location in location_of_player.get_connected_locations ()) {
            if ( input.contains (connected_location)) {
                return true;
            }
        }
        return false;
    }

    bool location_contains_item (string input) {
        foreach (string item in location_of_player.get_items ()) {
            if ( input.contains (item)) {
                return true;
            }
        }
        return false;
    }

    bool player_is_already_in_location (Location location) {
        return location.get_tag () == location_of_player.get_tag ();
    }
}
}
