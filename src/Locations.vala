namespace Application {
public class Locations : Object {

    static Locations? instance;
    Location[] locations = {};

    Locations () {
        locations += new Location (
            "road",
            "now on a long road. It's mostly used by traders heading to and from " + Constants.HOMETOWN + ". No one is around. In the distance \nyou see a " + Constants.location ("two-way fork") + " in the road",
            {"two-way fork"},
            {}
        );
        locations += new Location (
            "two-way fork",
            "now on a fork in the road. One path leads to a " + Constants.location ("field") + ". The other into a " + Constants.location ("forest"),
            {"road", "field", "forest"},
            {}
        );
        locations += new Location (
            "forest",
            "at the forest. As you try to enter the plants suddenly start to move and block your path. You should probably head back to the " + Constants.location ("two-way fork"),
            {"two-way fork"},
            {}
        );
        locations += new Location (
            "field",
            "in the field. There is scarecrow in the center with some crows on it picking on a " + Constants.item ("straw hat") + ". On the other side of the field you see a road that leads to a " + Constants.location ("cave"),
            {"cave"},
            {"straw hat"}
        );
        locations += new Location (
            "cave",
            "inside the cave. It's a lot darker here than outside. We should probably get a light. " + Constants.COMPANION + " says. There is a flaming " + Constants.item ("hole") + " on the wall. You should watch out for the " + Constants.location ("hole"),
            {"field", "hole"},
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
