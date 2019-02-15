namespace Application {
public class InputReactor : Object {

    private CommandLister command_lister = CommandLister.get_instance ();
    private TextHelper text_helper = new TextHelper ();
    private Player player = Player.get_instance ();

    static InputReactor? instance;

    public string input_string;

    InputReactor () {
    }

    public static InputReactor get_instance () {
        if (instance == null) {
            instance = new InputReactor ();
        }
        return instance;
    }

    public void log (string input_string) {
        command_lister.add_new_log( "--> " + input_string);
        reaction(input_string);
    }

    public void reaction (string input) {
        if ( input.contains ("look")) {
            player.look (input);
            return;
        }
        if ( input.contains ("go") || input.contains ("walk") || input.contains ("run")) {
            player.go (input);
            return;
        }
        if ( input.contains ("inventory")) {
            text_helper.show_inventory (player);
            return;
        }
        if ( input.contains ("equipment")) {
            text_helper.show_equipment (player);
            return;
        }
        if ( input.contains ("pickup")
            || input.contains ("take")
            || (input.contains ("pick") && input.contains ("up"))
            ) {
            player.pickup (input);
            return;
        }

        if ( input.contains ("equip") || input.contains ("wear")) {
            player.equip (input);
            return;
        }

        text_helper.show_help_text ();
    }
}
}
