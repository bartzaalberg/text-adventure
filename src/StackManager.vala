namespace Application {
public class StackManager : Object {

    static StackManager? instance;

    private Gtk.Stack stack;
    private const string WELCOME_VIEW_ID = "welcome-view";
    private const string COMMANDS_VIEW_ID = "commands-view";

    StackManager () {
        stack = new Gtk.Stack ();
        stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
    }

    public static StackManager get_instance () {
        if (instance == null) {
            instance = new StackManager ();
        }
        return instance;
    }

    public Gtk.Stack get_stack () {
        return this.stack;
    }

    public void load_views (Gtk.Window window) {
        stack.add_named (new WelcomeView (), WELCOME_VIEW_ID);
        stack.add_named (new CommandsView (), COMMANDS_VIEW_ID);

        window.add (stack);
    }
}
}
