namespace Application {
public class CommandInput : Gtk.Box {

    private InputReactor input_reactor = InputReactor.get_instance ();

    Gtk.Image icon;
    Gtk.TextView command_entry;
    Gtk.TextBuffer command_entry_buffer;

    public CommandInput () {

       icon = new Gtk.Image.from_icon_name ("storytelling", Gtk.IconSize.DND);

        command_entry_buffer = new Gtk.TextBuffer (null);
        command_entry_buffer.changed.connect((e) => {
            var description = command_entry_buffer.text;

            if(description.contains("pickup")){
                icon.set_from_icon_name ("item", Gtk.IconSize.DND);
                return;
            }

            if(description.contains("bliss")){
                icon.set_from_icon_name ("choice", Gtk.IconSize.DND);
                return;
            }

            if(description.contains("go")){
                icon.set_from_icon_name ("location", Gtk.IconSize.DND);
                return;
            }

            if(description.contains("look")){
                icon.set_from_icon_name ("examination", Gtk.IconSize.DND);
                return;
            }

            icon.set_from_icon_name ("storytelling", Gtk.IconSize.DND);
        });

        command_entry = new Gtk.TextView ();
        command_entry.set_buffer(command_entry_buffer);
        command_entry.hexpand = true;
        command_entry.get_style_context ().add_class ("command-entry");

        command_entry.key_press_event.connect((e)=>{
            if(e.keyval == Gdk.Key.Return) {
                if ((e.state & Gdk.Key.Shift_L) != 0 ||
                    (e.state & Gdk.Key.Shift_L) != 0) {
                    return false;
                }
                GLib.Timeout.add (0, () => {
                    input_reactor.log (command_entry_buffer.text);
                    command_entry_buffer.text = "";
                    return false;
                }, GLib.Priority.DEFAULT);
            }
            return false;
        });

        var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 10);
        box.get_style_context ().add_class ("command-entry-box");
        box.add (icon);
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

        this.get_style_context ().add_class ("command-view-grid");

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
