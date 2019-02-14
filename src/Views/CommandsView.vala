namespace Application {
public class CommandInput : Gtk.Box {

    Gtk.Box package_row;

    Gtk.Entry command_entry;
    Gtk.Label version_label;

    public CommandInput () {
        command_entry = new Gtk.Entry ();
        command_entry.hexpand = true;
        version_label = new Gtk.Label ("");

        var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 10);
        box.hexpand = true;
        box.add (command_entry);

        add (box);
    }
}

public class CommandsView : Gtk.Grid {

    private CommandLister command_lister = CommandLister.get_instance ();
    private TextHelper text_helper = new TextHelper ();

    public CommandsView () {

        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
        box.add (command_lister);

        box.hexpand = true;
        box.vexpand = true;
        var input_component = new CommandInput();
        attach (box, 0, 0, 1, 1);
        attach (input_component, 0, 1, 1, 1);

        text_helper.show_opening_text ();
    }
}
}
