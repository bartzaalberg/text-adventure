namespace Application {
public class MainWindow : Gtk.Window {

    private TextHelper text_helper = new TextHelper ();
    private Locations locations = Locations.get_instance ();
    private Player player = new Player ();


    construct {

        player.set_current_location (locations.get_list () [0]);
        text_helper.show_opening_text ();
        execute_look ("around");

        while (true) {
            stdout.printf ("--> ");
            string? input = stdin.read_line ().down ();
            stdout.printf ("\n");

            if ( input.contains ("look")) {
                if (player.get_current_location ().get_tag () == "hole") {
                    stdout.printf ("It's too dark to see.\n");
                    continue;
                }
                execute_look (input);
                continue;
            }
            if ( input.contains ("go") || input.contains ("walk") || input.contains ("run")) {
                execute_go (input);
                continue;
            }
            if ( input.contains ("inventory")) {
                text_helper.show_inventory (player);
                continue;
            }
            if ( input.contains ("pickup") || input.contains ("take")) {
                if (!current_location_contains_item (input)) {
                    stdout.printf ("The item isn't here\n");
                    continue;
                }
                player.pickup_item (input);
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

    void execute_look (string input) {
        if (input.contains ("around")) {
            stdout.printf ("You are %s.\n", player.get_current_location ().get_description ());
            return;
        }
        stdout.printf ("I don't understand what you want to see.\n");
    }

    void execute_go (string input) {
        foreach (Location location in locations.get_list ()) {
            if ( !(location_in_input (location, input))) {
                continue;
            }
            if (player.is_in_location (location)) {
                stdout.printf ("You are already here\n");
                return;
            }
            if ( !(player.can_move_to_location (input))) {
                stdout.printf ("You cant go there from here\n");
                return;
            }
            player.set_current_location (location);
            execute_look ("around");
            return;
        }
        stdout.printf ("I don't understand where you want to go.\n");
    }

    bool location_in_input (Location location, string input) {
        return input.contains (location.get_tag ());
    }

    bool current_location_contains_item (string input) {
        foreach (string item in player.get_current_location ().get_items ()) {
            if ( input.contains (item)) {
                return true;
            }
        }
        return false;
    }
}
}
