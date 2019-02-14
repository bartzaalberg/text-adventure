namespace Application.Constants {
    public const string APPLICATION_NAME = "com.github.bartzaalberg.python-tester";
    public const int APPLICATION_WIDTH = 700;
    public const int APPLICATION_HEIGHT = 500;
    public const string BOLDWHITE = "\033[32;1m";
    public const string BOLDRED = "\033[1m\033[31m";
    public const string BOLDGREEN = "\033[1m\033[32m";
    public const string BOLDYELLOW = "\033[1m\033[33m";
    public const string BOLDBLUE = "\033[1m\033[34m";
    public const string BOLDMAGENTA = "\033[1m\033[35m";
    public const string BOLDCYAN = "\033[1m\033[36m";

    public const string RESET = "\033[0m";
    public const string COMPANION = "James";
    public const string HOMETOWN = "Rosetown";

    public string location (string text) {
        return Constants.BOLDYELLOW + text + Constants.RESET;
    }

    public string item (string text) {
        return Constants.BOLDCYAN + text + Constants.RESET;
    }

    public string examination (string text) {
        return Constants.BOLDMAGENTA + text + Constants.RESET;
    }

    public string action (string text) {
        return Constants.BOLDBLUE + text + Constants.RESET;
    }

    public string game_command (string text) {
        return Constants.BOLDRED + text + Constants.RESET;
    }

    public string decision (string text) {
        return Constants.BOLDWHITE + text + Constants.RESET;
    }
}
