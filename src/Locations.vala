namespace Application {
public class Locations : Object {

    static Locations? instance;
    Location[] locations = {};

    Locations () {
        locations += new Location (
            "road",
            "now on a long road. It's mostly used by traders heading to and from " + Constants.HOMETOWN + ". No one is around. In the distance you see a " + Constants.location ("two-way fork") + " in the road",
            {"two-way fork"},
            {}
        );
        locations += new Location (
            "field",
            "in an open field. There are some coins and a straw hat next too you. You see a cave in the distance",
            {"cave"},
            {"silver coin", "copper coin", "straw hat"}
        );
        locations += new Location (
            "cave",
            "inside the cave. It's a lot darker here than outside. We should probably get a light. " + Constants.COMPANION + " says. There is a flaming torch on the wall. You shouldWatch out for the hole..",
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

    public Location? get_location_by_input (string input) {
        foreach (Location location in locations) {
            if ( input.contains (location.get_tag ())) {
                return location;
            }
        }
        return null;
    }
}
}
