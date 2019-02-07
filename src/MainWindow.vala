namespace Application {
public class MainWindow : Gtk.Window {

    private Location location_of_player;
    Location[] locations = {};

    construct {
        load_locations ();
        location_of_player = locations [0];
        show_opening_text ();
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
            if ( input.contains ("quit")) {
                stdout.printf ("\nBye!\n");
                break;
            }
            stdout.printf ("\nYou could try: \n");
            stdout.printf ("I "+ Constants.BOLDWHITE + "go" + Constants.RESET + " to the field \n");
            stdout.printf ("I "+ Constants.BOLDWHITE + "look around" + Constants.RESET + " me \n");
            stdout.printf ("I want to "+ Constants.BOLDWHITE + "quit" + Constants.RESET + " \n");
        }
        return;
    }

    void load_locations () {
        locations += new Location ("field","in an open field. You see a cave in the distance", {"cave"});
        locations += new Location ("cave","in the cave. Watch out for the hole..", {"cave", "hole"});
        locations += new Location (
            "hole",
            "at dark hole.OH NO! You fell in.. its way to dark to see anything here",
            {"hole"}
        );
    }

    void show_opening_text () {
        stdout.printf ("            ^             \n");
        stdout.printf ("           / \\            \n");
        stdout.printf ("          / | \\           \n");
        stdout.printf ("         /| | |\\          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("/        || | ||        \\ \n");
        stdout.printf ("|-------- | | | --------| \n");
        stdout.printf ("|-------- | | | --------| \n");
        stdout.printf ("\\         | | |         / \n");
        stdout.printf ("         /| | |\\          \n");
        stdout.printf ("         \\| | |/          \n");
        stdout.printf ("          \\ | /           \n");
        stdout.printf ("                          \n");
        stdout.printf ("Welcome to THE TEXT ADVENTURE.\n");
        stdout.printf ("\n");
        stdout.printf ("\n");
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
            if ( !(input.contains (location.get_tag ()))) {
                continue;
            }
            if (location.get_tag () == location_of_player.get_tag ()) {
                stdout.printf ("You are already here\n");
                return;
            }
            if (player_can_move_to_location (input) == false) {
                stdout.printf ("You cant go there from here\n");
                return;
            }
            location_of_player = location;
            execute_look ("around");
            return;
        }
        stdout.printf ("I don't understand where you want to go.\n");
    }

    bool player_can_move_to_location (string input) {
        foreach (string connected_location in location_of_player.get_connected_locations ()) {
            if ( input.contains (connected_location)) {
                return true;
            }
        }
        return false;
    }
}
}
