using Granite.Widgets;

namespace Application {
public class CommandLogRow : Gtk.ListBoxRow {

    private Gtk.Box vertical_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
    private Gtk.Box package_row;
    private Gtk.Label summary_label;
    private Gtk.Image icon;

    public CommandLogRow (string description) {
        package_row = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        package_row.get_style_context().add_class("log-row");

        reload_view (description);
        this.add (package_row);
    }

    public void reload_view (string description) {

        icon = new Gtk.Image.from_icon_name ("storytelling", Gtk.IconSize.DND);

        if(description.contains("-->")){
            if(description.contains(Constants.COLOR_ITEM)){
                icon = new Gtk.Image.from_icon_name ("item", Gtk.IconSize.DND);
            }

            if(description.contains(Constants.COLOR_DECISION)){
                icon = new Gtk.Image.from_icon_name ("choice", Gtk.IconSize.DND);
            }

            if(description.contains(Constants.COLOR_LOCATION)){
                icon = new Gtk.Image.from_icon_name ("location", Gtk.IconSize.DND);
            }

            if(description.contains(Constants.COLOR_EXAMINATION)){
                icon = new Gtk.Image.from_icon_name ("examination", Gtk.IconSize.DND);
            }
        }

        icon.get_style_context().add_class("log-row-image");
        icon.set_valign(Gtk.Align.START);
        icon.set_halign(Gtk.Align.START);

        summary_label = new Gtk.Label ("");
        summary_label.set_text (description);
        summary_label.set_line_wrap(true);
        summary_label.set_use_markup(true);
        summary_label.set_xalign(0);
        summary_label.get_style_context().add_class("log-row-description");

        vertical_box.add (summary_label);

        package_row.add (icon);
        package_row.add (vertical_box);
    }
}
}
