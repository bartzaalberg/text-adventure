namespace Application {
public class Locations : Object {

    static Locations? instance;
    Location[] locations = {};

    Locations () {
        locations += new Location (
            "field",
            "in an open field. There are some coins and a straw hat next too you. You see a cave in the distance",
            {"cave"},
            {"silver coin", "copper coin", "straw hat"}
        );
        locations += new Location (
            "cave",
            "in the cave. The is a flaming torch on the wall. Watch out for the hole..",
            {"cave", "hole"},
            {"torch"}
        );
        locations += new Location (
            "hole",
            "at dark hole.OH NO! You fell in.. its way to dark to see anything here",
            {"hole"},
            {}
        );
    }

    public static Locations get_instance () {
        if (instance == null) {
            instance = new Locations ();
        }
        return instance;
    }

    public Location [] get_list () {
        return locations;
    }
}
}
