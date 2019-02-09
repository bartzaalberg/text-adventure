namespace Application {
public class TextHelper : Object {

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
        stdout.printf ("Welcome to THE TEXT ADVENTURE.\n");
        stdout.printf ("\n");
        stdout.printf ("\n");
        stdout.printf ("A worried-looking man I would come to know as James answered the heavy door. He looks at me, and sees my desperation.\n");
        stdout.printf ("What happened? He asks confused. We don't have time for this. Every second counts as she is moved further away from \n");
        stdout.printf ("Rosetown. Let me in James, I say frustrated. You know there is no time for a chat. He nods and asks me to follow him. \n");
        stdout.printf ("We hurry through the backdoor and silently run through the streets.\n ");
    }

    public void show_help_text () {
        stdout.printf ("\nYou could try: \n");
        stdout.printf ("I " + bold ("go") + " to the " + bold ("field") + "\n");
        stdout.printf ("I " + bold ("look around") + " me \n");
        stdout.printf ("Show me my " + bold ("inventory") + " me \n");
        stdout.printf (bold ("Pickup") + " the straw hat \n");
        stdout.printf ("I want to " + bold ("quit") + " \n");
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
