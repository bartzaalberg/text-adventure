namespace Application {
public class TextHelper : Object {
    private Player player = Player.get_instance ();

    private CommandLister command_lister = CommandLister.get_instance ();

    public void show_opening_text () {
        var log = "";
        log += "Chapter 1 - A hasty journey.\n";
        log += "\n";
        log += "\n";
        log += "A worried-looking man I would come to know as " + Constants.COMPANION + " answered the heavy door. He looks at me, and sees my desperation. What happened? He asks confused. We don't have time for this. Every second counts as she is moved further away from " + Constants.HOMETOWN + ". Let me in " + Constants.COMPANION + ", I say frustrated. You know there is no time for a chat. He nods and asks me to follow him. We hurry through the backdoor and silently run to the stable.\n\n" + Constants.COMPANION + " already prepared the horses yesterday. You open the door and see two packed horses. Which one do you want? " + Constants.decision ("Bliss") + " the swift? Or " + Constants.decision ("Rusty") + " the bold.";

        var input_reactor = InputReactor.get_instance ();
        command_lister.add_new_log( log);
        input_reactor.input_type = "pick_a_horse";
    }

    public void show_help_text () {
        var log = "";
        log += "You could try: \n";
        log += "I " + Constants.location ("go") + " to the " + Constants.location ("field") + "\n";
        log += "I " + Constants.examination ("look around") + " me \n";
        log += "Look at my " + Constants.item ("inventory") + "\n";
        log += "View my " + Constants.item ("equipment") + "\n";
        log += Constants.item ("Equip") + " the " + Constants.item("sword") + "\n";
        log += Constants.item ("Pickup") + " the " + Constants.item("sword") + "\n";
        log += Constants.decision ("yes") + " or " + Constants.decision ("no") + " \n";
        // log += "I want to " + Constants.game_command ("quit") + " \n";
        command_lister.add_new_log (log);
    }

    public void pick_a_horse (string horse_name) {
        if(!horse_name.contains("bliss") && !horse_name.contains("rusty")) {
            command_lister.add_new_log ("Come on we don't have time for your rambling. Just say the name of your horse! \n");
            return;
        }

        var input_reactor = InputReactor.get_instance ();
        input_reactor.input_type = null;

        player.set_horse_name (horse_name.contains("bliss") ? "Bliss" : "Rusty");
        var horse = player.get_horse_name () == "Bliss" ? "Rusty" : "Bliss";

        var log = ("A fine choice, he says while hopping on " + horse + ". ");

        if (player.get_horse_name () == "Bliss") {
            log += "Bliss is a strong horse, very fast. But a bit of a chicken though, scared very quickly.";
        }

        if (player.get_horse_name () == "Rusty") {
            log += "Rusty is getting a bit old, but he's brave as lion. ";
        }

        log += "I climb on " + player.get_horse_name () + " and grab the reins. Let's head out.\n\nWe ride for the townsgate. Near the gate I see two man lying in a pool of blood. The town guards. The first facedown with 2 arrows in the back. The second probably noticed the attackers. His sword next to him and a deep cut from his waist to his neck. They didn't stand a chance.\n\nThere is nothing we can do for them, James says. Trotting through the gate. I follow him.";

        command_lister.add_new_log (log);
        player.look ("around");
    }

    public void show_inventory (Player player) {
        var inventory = "Inventory: \n";
        if (player.show_inventory ().length == 0) {
            inventory += "You dont have any items.";

            command_lister.add_new_log (inventory);
            return;
        }

        foreach (Item item in player.show_inventory ()) {
            inventory = Constants.item (item.get_tag()) + "\n";
        }

        command_lister.add_new_log (inventory);
    }

    public void show_equipment (Player player) {
        var inventory = "Equipment: \n";
        inventory += "Helmet: " + (player.get_helmet() == null ? "No helmet" : Constants.item (player.get_helmet().get_tag())) + "\n";
        inventory += "Chest: " + (player.get_chest() == null ? "No chest" : Constants.item (player.get_chest().get_tag())) + "\n";
        inventory += "Pants: " + (player.get_pants() == null ? "No pants" : Constants.item (player.get_pants().get_tag())) + "\n";
        inventory += "Weapon: " + (player.get_weapon() == null ? "No weapon" : Constants.item (player.get_weapon().get_tag())) + "\n";
    }
}
}
