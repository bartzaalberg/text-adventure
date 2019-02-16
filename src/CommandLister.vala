using Granite.Widgets;

namespace Application {
public class CommandLister : Gtk.ListBox {

    static CommandLister? instance;

    CommandLister () {
    }

    public static CommandLister get_instance () {
        if (instance == null) {
            instance = new CommandLister ();
        }
        return instance;
    }

    public void add_new_log (string description) {
            var log = new CommandLogRow (description);
            this.add(log);
            log.show_all();
            scroll_to_bottom();
    }

    public async void scroll_to_bottom () {
      GLib.Timeout.add (100, () => {
            this.get_adjustment().set_value(this.get_adjustment().get_upper());
            return false;
        }, GLib.Priority.DEFAULT);
    }
}
}
