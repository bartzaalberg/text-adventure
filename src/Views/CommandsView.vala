namespace Application {
public class CommandInput : Gtk.Box {

    private InputReactor input_reactor = InputReactor.get_instance ();

    Gtk.Entry command_entry;

    public CommandInput () {
        command_entry = new Gtk.Entry ();
        command_entry.hexpand = true;
        command_entry.activate.connect(()=>{
            input_reactor.log (command_entry.get_text());
            command_entry.set_text("");
        });

        var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 10);
        box.margin = 12;
        box.hexpand = true;
        box.add (command_entry);
        add (box);
    }
}

public class CommandsView : Gtk.Grid {

    private CommandLister command_lister = CommandLister.get_instance ();
    private Player player = Player.get_instance ();
    private Locations locations = Locations.get_instance ();
    private TextHelper text_helper = new TextHelper ();

    public CommandsView () {
        var scrolled_window = new Gtk.ScrolledWindow(null,null);
        scrolled_window.add(command_lister);
        scrolled_window.hexpand = true;
        scrolled_window.vexpand = true;

        var input_component = new CommandInput();
        attach (scrolled_window, 0, 0, 1, 1);
        attach (input_component, 0, 1, 1, 1);

        player.set_current_location (locations.get_list () [0]);
        text_helper.show_opening_text ();
    }
}
}
