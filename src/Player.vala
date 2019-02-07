namespace Application {
public class Player : Object {

    string[] inventory = {};

    public string[] show_inventory () {
        return this.inventory;
    }

    public void pickup_item (string input, Item[] items) {
        foreach (Item item in items) {
            if ( input.contains (item.get_tag ())) {
                inventory += item.get_tag ();
                break;
            }
        }
    }
}
}
