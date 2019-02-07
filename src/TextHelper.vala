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
    }

    public void show_help_text () {
        stdout.printf ("\nYou could try: \n");
        stdout.printf ("I " + bold ("go") + " to the field \n");
        stdout.printf ("I " + bold ("look around") + " me \n");
        stdout.printf ("I want to " + bold ("quit") + " \n");
    }

    public string bold (string text) {
        return Constants.BOLDWHITE + text + Constants.RESET;
    }
}
}
