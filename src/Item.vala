namespace Application {
public class Item : Object {

    private string tag;

    public Item (string tag) {
        this.tag = tag;
    }

    public string get_tag () {
        return this.tag;
    }
}
}
