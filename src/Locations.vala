namespace Application {
public class Locations : Object {

    static Locations? instance;
    Location[] locations = {};

    Locations () {
        locations += new Location (
            "road",
            "now on a long road. It's mostly used by traders heading to and from " + Constants.HOMETOWN + ". No one is around. In the \ndistance you see a " + Constants.location ("two-way fork") + " in the road." + "There are horse tracks heading in that direction",
            {"two-way fork"},
            {}
        );
        locations += new Location (
            "two-way fork",
            "now on the two-way fork. One path leads to an " + Constants.location ("old farm") + ". The other into a " + Constants.location ("forest") + ". Horse tracks continue in the \ndirection of the farm",
            {"road", "old farm", "forest"},
            {}
        );
        locations += new Location (
            "forest",
            "at the forest. As you try to enter the plants suddenly start to move and block your path. I've heard people \nwent missing in these woods, " + Constants.COMPANION + " says. We should probably head back to the " + Constants.location ("two-way fork"),
            {"two-way fork"},
            {}
        );
        locations += new Location (
            "old farm",
            "at the old farm. It looks abandoned. The door of the " + Constants.location ("farmhouse") + " is wide open. The field overgrown with weeds \nand a scarecrow standing at the center. Some crows sitting on his shoulders are picking on his " + Constants.item ("straw hat") + ". The road \ncontinues past the house leading to the " + Constants.location ("river"),
            {"two-way fork", "farmhouse", "river"},
            {"straw hat"}
        );
        locations += new Location (
            "farmhouse",
            "in inside the farmhouse. It's very small. It hasn't been used for a very long time. Plants are starting \nto grow inside, windows are broken and the door is out of a hinge.  In the left corner you see a wooden table with an " + Constants.item("old book") + ". \nNext to it stands a broken bed. On the other side of the room you see is an open closet. It's been robbed clean",
            {"old farm"},
            {"old book"}
        );
        locations += new Location (
            "river",
            "at the river. The horse tracks stop here. There was a bridge, the must have cut the ropes, " + Constants.COMPANION + " says. The current is too strong, we cannot cross. The only way across is passing through the cave " + Constants.location("east") + " from here but it's inhabited by bandits. I frown, they must have found out we are following them. But a couple of bandits aren't stopping me " + Constants.COMPANION + ". He smiles 'Then let's head " + Constants.location("east") + "'",
            {"old farm", "east"},
            {}
        );
        locations += new Location (
            "east",
            "are at the entrance of the cave. The river runs inside. you see a broken bridge hanging around some rocks on the shore. Must be the one cut down near the old farm. Along the river is a narrow path just wide enough for the horses leading " + Constants.location("inside the cave") + ". A wooden sign hangs above entrance saying: 'Not a hideout for bandits'",
            {"river", "inside the cave"},
            {}
        );
        locations += new Location (
            "inside the cave",
            "inside the cave. The path continues alongside river. The deeper you go, the darker it gets but you see a small " + Constants.location("flickering light") + " in the distance. We should probably get that light, " + Constants.COMPANION + " whispers\n",
            {"flickering light"},
            {}
        );
        locations += new Location (
            "flickering light",
            "nearing the light. You notice you are now in an open space. You see 2 bandits. 1 holding a torch. Probably patrolling their hideout entrance. High above the bandits hangs a bridge which crosses the water. The back of the room leads to a " + Constants.location("passage") + " going up",
            {"inside the cave", "passage"},
            {"torch"}
        );
        locations += new Location (
            "passage",
            "walking through the passage. It's a narrow path spiralling up to the right. At the end of the passage you see the bridge",
            {"flickering light", "bridge"},
            {}
        );
        locations += new Location (
            "bridge",
            "at the bridge. It's made giant rocks and can easily hold the horses. At the end of the bridge you see light. It leads outside",
            {"passage", "outside"},
            {}
        );
        locations += new Location (
            "outside",
            "outside now. You are on a ledge above a " + Constants.location("lake") + ". The only way down is jumping down. You cannot get back up.",
            {"passage", "lake"},
            {}
        );
        locations += new Location (
            "lake",
            "in the lake. It's cold and deep. You should probably swim to the shore.",
            {"shore"},
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
