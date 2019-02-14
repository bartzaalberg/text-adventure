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

    public void empty_list () {
        // this.foreach ((CommandLogRow) => {
            // this.remove (ListBoxRow);
        // });
    }

    public void get_installed_packages () {

        // var installed_packages = response_translator.get_installed_packages ();

        // empty_list ();
        // foreach (Location location in locations) {

            var log = new CommandLogRow ("blablaijwd");
            this.add(log);
            log.show_all();
            var log2 = new CommandLogRow ("blablaijwd");
            this.add(log2);
            log2.show_all();
    }

    public void add_new_log (string description) {
            var log = new CommandLogRow (description);
            this.add(log);
            log.show_all();
    }
}
}
