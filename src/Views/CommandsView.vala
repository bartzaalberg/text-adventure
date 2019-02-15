namespace Application {
public class CommandInput : Gtk.Box {

    private InputReactor input_reactor = InputReactor.get_instance ();

    Gtk.Box package_row;
    Gtk.Entry command_entry;

    public CommandInput () {
        command_entry = new Gtk.Entry ();
        command_entry.hexpand = true;

       var type_button = new Gtk.Button.with_label (_("Send"));
        type_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        type_button.clicked.connect (() => {
            input_reactor.log (command_entry.get_text());
            command_entry.set_text("");
        });

        var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 10);
        box.margin = 12;
        box.hexpand = true;
        box.add (command_entry);
        box.add (type_button);

        add (box);
    }
}

public class CommandsView : Gtk.Grid {

    private CommandLister command_lister = CommandLister.get_instance ();
    private TextHelper text_helper = new TextHelper ();
    private Player player = Player.get_instance ();
    private Locations locations = Locations.get_instance ();

    public CommandsView () {
        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
        box.add (command_lister);
        box.hexpand = true;
        box.vexpand = true;

        var window = new Gtk.ScrolledWindow(null,null);
        window.add(box);

        var input_component = new CommandInput();
        attach (window, 0, 0, 1, 1);
        attach (input_component, 0, 1, 1, 1);

        player.set_current_location (locations.get_list () [0]);
        text_helper.show_opening_text ();
        player.look ("around");
    }
}
}
