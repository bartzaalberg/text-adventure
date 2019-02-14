using Granite.Widgets;

namespace Application {
public class WelcomeView : Gtk.ScrolledWindow {

    private StackManager stack_manager = StackManager.get_instance ();

    public WelcomeView () {
        var welcome_view = new Welcome (_("Text Adventure"), _("The story of a guy and his horse"));
        welcome_view.append ("open", _("New Game"), _("Start a new adventure"));

        welcome_view.activated.connect ((option) => {
            switch (option) {
                case 0:
                    stack_manager.get_stack ().visible_child_name = "commands-view";

                    break;
            }
        });
        this.add (welcome_view);
    }
}
}
