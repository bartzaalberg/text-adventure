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
                player.go (input);
                continue;
            }
            if ( input.contains ("inventory")) {
                text_helper.show_inventory (player);
                continue;
            }
            if ( input.contains ("pickup") || input.contains ("take")) {
                player.pickup (input);
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
}
}
