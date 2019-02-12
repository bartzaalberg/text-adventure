namespace Application {
public class TextHelper : Object {
    private Player player = Player.get_instance ();

    public void show_opening_text () {
        stdout.printf ("            ^             \n");
        stdout.printf ("           / \\            \n");
        stdout.printf ("          / | \\           \n");
        stdout.printf ("         /| | |\\          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("         || | ||          \n");
        stdout.printf ("/        || | ||        \\ \n");
        stdout.printf ("|-------- | | | --------| \n");
        stdout.printf ("|-------- | | | --------| \n");
        stdout.printf ("\\         | | |         / \n");
        stdout.printf ("         /| | |\\          \n");
        stdout.printf ("         \\| | |/          \n");
        stdout.printf ("          \\ | /           \n");
        stdout.printf ("                          \n");
        stdout.printf ("Chapter 1 - A hasty journey.\n");
        stdout.printf ("\n");
        stdout.printf ("\n");
        stdout.printf ("A worried-looking man I would come to know as James answered the heavy door. He looks at me, and sees my desperation.\n");
        stdout.printf ("What happened? He asks confused. We don't have time for this. Every second counts as she is moved further away from \n");
        stdout.printf ("Rosetown. Let me in James, I say frustrated. You know there is no time for a chat. He nods and asks me to follow him. \n");
        stdout.printf ("We hurry through the backdoor and silently run to the stable.\n ");
        stdout.printf ("\n");
        stdout.printf ("James already prepared the horses yesterday. You open the door and see two packed horses. Which one do you want? Bliss the swift? Or Rusty the bold.\n");
        pick_a_horse();
    }

    public void show_help_text () {
        stdout.printf ("\nYou could try: \n");
        stdout.printf ("I " + bold ("go") + " to the " + bold ("field") + "\n");
        stdout.printf ("I " + bold ("look around") + " me \n");
        stdout.printf ("Show me my " + bold ("inventory") + " me \n");
        stdout.printf (bold ("Pickup") + " the straw hat \n");
        stdout.printf ("I want to " + bold ("quit") + " \n");
    }

    public void pick_a_horse () {
        stdout.printf ("I'll have --> ");
        string? horse_name = stdin.read_line ().down ();
        stdout.printf ("\n");

        if(horse_name != "bliss" && horse_name != "rusty"){
            stdout.printf ("Come on we don't have time for your rambling. Just say the name of your horse! \n");
            pick_a_horse ();
        }

        player.set_horse_name (horse_name);
        stdout.printf ("A fine choice, he says while hopping on ");
        stdout.printf (player.get_horse_name () == "bliss" ? "Rusty" : "Bliss");
        stdout.printf (".\n");

        if (player.get_horse_name () == "bliss") {
            stdout.printf ("Bliss is a strong horse, very fast. But a bit of a chicken though, scared very quickly. \n");
        }

        if (player.get_horse_name () == "rusty") {
            stdout.printf ("Rusty is getting a bit old, but he's brave as lion. \n");
        }
    }

    public void show_inventory (Player player) {
        stdout.printf ("Inventory: \n");
        if (player.show_inventory ().length == 0) {
            stdout.printf ("You dont have any items \n");
            return;
        }
        foreach (string item in player.show_inventory ()) {
            stdout.printf (bold (item + "\n"));
        }
    }

    public string bold (string text) {
        return Constants.BOLDWHITE + text + Constants.RESET;
    }
}
}
