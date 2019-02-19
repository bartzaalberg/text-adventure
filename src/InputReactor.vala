namespace Application {
public class InputReactor : Object {

    private CommandLister command_lister = CommandLister.get_instance ();
    private TextHelper text_helper = new TextHelper ();
    private Player player = Player.get_instance ();

    static InputReactor? instance;

    public string input_string;
    public string input_type;

    InputReactor () {
    }

    public static InputReactor get_instance () {
        if (instance == null) {
            instance = new InputReactor ();
        }
        return instance;
    }

    private string highlight_words(string raw_input_string) {
        var str = raw_input_string;

        str = str.replace ("look", Constants.examination("look"));
        str = str.replace ("go", Constants.location("go"));
        str = str.replace ("walk", Constants.location("walk"));
        str = str.replace ("run", Constants.location("run"));
        str = str.replace ("inventory", Constants.item("inventory"));
        str = str.replace ("equipment", Constants.item("equipment"));
        str = str.replace ("pickup", Constants.item("pickup"));
        str = str.replace ("take", Constants.item("take"));
        str = str.replace ("pick", Constants.item("pick"));
        str = str.replace ("equip", Constants.item("equip"));
        str = str.replace ("wear", Constants.item("wear"));

        return str;
    }

    public async void log (string raw_input_string) {
        var input_string = highlight_words(raw_input_string.down().replace ("\n", ""));

        command_lister.add_new_log( "--> " + input_string);
        reaction(input_string);
    }

    public void reaction (string input) {
        if ( input_type == "pick_a_horse") {
            text_helper.pick_a_horse(input);
            return;
        }

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
