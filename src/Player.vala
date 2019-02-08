namespace Application {
public class Player : Object {

    private Items items = Items.get_instance ();
    string[] inventory = {};

    public string[] show_inventory () {
        return this.inventory;
    }

    public void pickup_item (string input) {
        foreach (Item item in items.get_list ()) {
            if ( input.contains (item.get_tag ())) {
                inventory += item.get_tag ();
                break;
            }
        }
    }
}
}
