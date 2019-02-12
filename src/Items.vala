namespace Application {
public class Items : Object {

    static Items? instance;
    Item[] items = {};

    Items () {
        items += new Item ("torch", "etc");
        items += new Item ("straw hat", "helmet");
    }

    public static Items get_instance () {
        if (instance == null) {
            instance = new Items ();
        }
        return instance;
    }

    public Item [] get_list () {
        return items;
    }
}
}
