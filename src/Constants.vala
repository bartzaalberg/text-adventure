namespace Application.Constants {
    public const string APPLICATION_NAME = "com.github.bartzaalberg.python-tester";
    public const int APPLICATION_WIDTH = 700;
    public const int APPLICATION_HEIGHT = 500;
    public const string COLOR_LOCATION = "#009113";
    // public const string COLOR_GAME_COMMAND = "#ff0000";
    public const string COLOR_DECISION = "#f4a442";
    public const string COLOR_EXAMINATION = "#f442ee";
    public const string COLOR_ITEM = "#4286f4";

    public const string COMPANION = "James";
    public const string HOMETOWN = "Rosetown";

    public string location (string text) {
        return "<span foreground=\""+COLOR_LOCATION+"\">" + text +"</span>";
    }

    public string item (string text) {
        return "<span foreground=\""+COLOR_ITEM+"\">" + text +"</span>";
    }

    public string examination (string text) {
        return "<span foreground=\""+COLOR_EXAMINATION+"\">" + text +"</span>";
    }

    // public string game_command (string text) {
    //     return "<span foreground=\""+COLOR_GAME_COMMAND+"\">" + text +"</span>";
    // }

    public string decision (string text) {
        return "<span foreground=\""+COLOR_DECISION+"\">" + text +"</span>";
    }
}
