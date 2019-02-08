namespace Application {
public class Items : Object {

    static Items? instance;
    Item[] items = {};

    Items () {
        items += new Item ("copper coin");
        items += new Item ("silver coin");
        items += new Item ("torch");
        items += new Item ("straw hat");
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
