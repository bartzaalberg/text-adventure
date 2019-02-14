namespace Application {
public class TextHelper : Object {
    private Player player = Player.get_instance ();

    private CommandLister command_lister = CommandLister.get_instance ();

    public void show_opening_text () {
        var log = "";
        log += "            ^             \n";
        log += "           / \\            \n";
        log += "          / | \\           \n";
        log += "         /| | |\\          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "         || | ||          \n";
        log += "/        || | ||        \\ \n";
        log += "|-------- | | | --------| \n";
        log += "|-------- | | | --------| \n";
        log += "\\         | | |         / \n";
        log += "         /| | |\\          \n";
        log += "         \\| | |/          \n";
        log += "          \\ | /           \n";
        log += "                          \n";
        log += "Chapter 1 - A hasty journey.\n";
        log += "\n";
        log += "\n";
        log += "A worried-looking man I would come to know as " + Constants.COMPANION + " answered the heavy door. He looks at me, and sees my desperation. What happened? He asks confused. We don't have time for this. Every second counts as she is moved further away from " + Constants.HOMETOWN + ". Let me in " + Constants.COMPANION + ", I say frustrated. You know there is no time for a chat. He nods and asks me to follow him. \n";
        // stdout.printf ("We hurry through the backdoor and silently run to the stable.\n");
        // stdout.printf ("\n");
        // stdout.printf (Constants.COMPANION + " already prepared the horses yesterday. You open the door and see two packed horses. Which one do you want? \n");
        // stdout.printf (Constants.decision ("Bliss") + " the swift? Or " + Constants.decision ("Rusty") + " the bold.\n");
        // pick_a_horse();
        // stdout.printf ("I climb on " + player.get_horse_name () + " and grab the reins. Let's head out. \n");
        // stdout.printf ("\n");
        // stdout.printf ("We ride for the townsgate. Near the gate I see two man lying in a pool of blood. The town guards. The first facedown\n");
        // stdout.printf ("with 2 arrows in the back. The second probably noticed the attackers. His sword next to him and a deep cut from his \n");
        // stdout.printf ("waist to his neck. They didn't stand a chance.\n");
        // stdout.printf ("\n");
        // stdout.printf ("There is nothing we can do for them, James says. Trotting through the gate. I follow him. \n");
        command_lister.add_new_log( log);
    }

    public void show_help_text () {
        stdout.printf ("\nYou could try: \n");
        stdout.printf ("I " + Constants.location ("go") + " to the " + Constants.location ("field") + "\n");
        stdout.printf ("I " + Constants.examination ("look around") + " me \n");
        stdout.printf ("Look at my " + Constants.item ("inventory") + "\n");
        stdout.printf ("View my " + Constants.item ("equipment") + "\n");
        stdout.printf (Constants.item ("Equip") + " the " + Constants.item("sword") + "\n");
        stdout.printf (Constants.item ("Pickup") + " the " + Constants.item("sword") + "\n");
        stdout.printf ("I want to " + Constants.game_command ("quit") + " \n");
    }

    public void pick_a_horse () {
        stdout.printf ("I'll have --> ");
        string? horse_name = stdin.read_line ().down ();
        stdout.printf ("\n");

        if(horse_name != "bliss" && horse_name != "rusty"){
            stdout.printf ("Come on we don't have time for your rambling. Just say the name of your horse! \n");
            pick_a_horse ();
            return;
        }

        player.set_horse_name (horse_name == "bliss" ? "Bliss" : "Rusty");
        stdout.printf ("A fine choice, he says while hopping on ");
        stdout.printf (player.get_horse_name () == "Bliss" ? "Rusty" : "Bliss");
        stdout.printf (". ");

        if (player.get_horse_name () == "bliss") {
            stdout.printf ("Bliss is a strong horse, very fast. But a bit of a chicken though, \n");
            stdout.printf ("scared very quickly. ");
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
        foreach (Item item in player.show_inventory ()) {
            stdout.printf (Constants.item (item.get_tag() + "\n"));
        }
    }

    public void show_equipment (Player player) {
        stdout.printf ("Equipment: \n");
        stdout.printf ("Helmet: " + (player.get_helmet() == null ? "No helmet" : Constants.item (player.get_helmet().get_tag())) + "\n");
        stdout.printf ("Chest: " + (player.get_chest() == null ? "No chest" : Constants.item (player.get_chest().get_tag())) + "\n");
        stdout.printf ("Pants: " + (player.get_pants() == null ? "No pants" : Constants.item (player.get_pants().get_tag())) + "\n");
        stdout.printf ("Weapon: " + (player.get_weapon() == null ? "No weapon" : Constants.item (player.get_weapon().get_tag())) + "\n");
    }
}
}
