namespace Application {
public class MainWindow : Gtk.Window {

    private TextHelper text_helper = new TextHelper ();
    private Locations locations = Locations.get_instance ();
    private Player player = new Player ();


    construct {
        player.set_current_location (locations.get_list () [0]);
        text_helper.show_opening_text ();
        player.look ("around");

        while (true) {
            stdout.printf ("--> ");
            string? input = stdin.read_line ().down ();
            stdout.printf ("\n");

            if ( input.contains ("look")) {
                player.look (input);
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
                player.pickup_item (input);
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

    void execute_go (string input) {
        foreach (Location location in locations.get_list ()) {
            if ( !(location_is_found_in_input (location, input))) {
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
            player.look ("around");
            return;
        }
        stdout.printf ("I don't understand where you want to go.\n");
    }

    bool location_is_found_in_input (Location location, string input) {
        return input.contains (location.get_tag ());
    }
}
}
