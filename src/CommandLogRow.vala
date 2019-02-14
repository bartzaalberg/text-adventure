using Granite.Widgets;

namespace Application {
public class CommandLogRow : Gtk.ListBoxRow {

    private Gtk.Box vertical_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
    private Gtk.Box package_row;
    private Gtk.Label summary_label;
    private Gtk.Image icon;

    public CommandLogRow (string description) {

        // this.package = package;
        package_row = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        reload_view (description);
        this.add (package_row);
    }

    public void reload_view (string description) {
        icon = new Gtk.Image.from_icon_name ("terminal", Gtk.IconSize.DND);
        summary_label = new Gtk.Label ("");
        summary_label.set_line_wrap(true);
        summary_label.set_text (description);

        vertical_box.add (summary_label);

        package_row.margin = 12;
        package_row.add (icon);
        package_row.add (vertical_box);
    }
}
}
