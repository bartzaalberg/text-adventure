namespace Application {
public class MainWindow : Gtk.Window {

    private StackManager stack_manager = StackManager.get_instance ();
    private TextHelper text_helper = new TextHelper ();
    private Locations locations = Locations.get_instance ();
    private Player player = Player.get_instance ();

    private uint configure_id;


    public MainWindow (Gtk.Application application) {
        Object (application: application,
                icon_name: Constants.APPLICATION_NAME,
                resizable: true,
                height_request: Constants.APPLICATION_HEIGHT,
                width_request: Constants.APPLICATION_WIDTH);
    }

    construct {
        stack_manager.load_views (this);
    }

    // construct {
    //     player.set_current_location (locations.get_list () [0]);
    //     text_helper.show_opening_text ();
    //     player.look ("around");

    //     while (true) {
    //         stdout.printf ("--> ");
    //         string? input = stdin.read_line ().down ();
    //         stdout.printf ("\n");

    //         if ( input.contains ("look")) {
    //             player.look (input);
    //             continue;
    //         }
    //         if ( input.contains ("go") || input.contains ("walk") || input.contains ("run")) {
    //             player.go (input);
    //             continue;
    //         }
    //         if ( input.contains ("inventory")) {
    //             text_helper.show_inventory (player);
    //             continue;
    //         }
    //         if ( input.contains ("equipment")) {
    //             text_helper.show_equipment (player);
    //             continue;
    //         }
    //         if ( input.contains ("pickup")
    //             || input.contains ("take")
    //             || (input.contains ("pick") && input.contains ("up"))
    //             ) {
    //             player.pickup (input);
    //             continue;
    //         }

    //         if ( input.contains ("equip") || input.contains ("wear")) {
    //             player.equip (input);
    //             continue;
    //         }

    //         if ( input.contains ("quit")) {
    //             stdout.printf ("\nBye!\n");
    //             break;
    //         }

    //         text_helper.show_help_text ();
    //     }
    //     return;
    // }

    public override bool configure_event (Gdk.EventConfigure event) {
        var settings = new GLib.Settings (Constants.APPLICATION_NAME);

        if (configure_id != 0) {
            GLib.Source.remove (configure_id);
        }

        configure_id = Timeout.add (100, () => {
            configure_id = 0;

            if (is_maximized) {
                settings.set_boolean ("window-maximized", true);
            } else {
                settings.set_boolean ("window-maximized", false);

                Gdk.Rectangle rect;
                get_allocation (out rect);
                settings.set ("window-size", "(ii)", rect.width, rect.height);

                int root_x, root_y;
                get_position (out root_x, out root_y);
                settings.set ("window-position", "(ii)", root_x, root_y);
            }

            return false;
        });

        return base.configure_event (event);
    }
}
}
