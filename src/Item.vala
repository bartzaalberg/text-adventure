namespace Application {
public class Item : Object {

    private string tag;
    private string type;

    public Item (string tag, string type) {
        this.tag = tag;
        this.type = type;
    }

    public string get_tag () {
        return this.tag;
    }

    public string get_item_type () {
        return this.type;
    }

    public bool is_equipable () {
        if (
            type == "helmet"
            || type == "chest"
            || type == "pants"
            || type == "weapon"
        ) {
            return true;
        }
        return false;
    }
}
}
