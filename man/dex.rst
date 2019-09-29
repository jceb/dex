dex
===

Synopsis
--------

**dex** [*options*] [*DesktopEntryFile*]...

Description
-----------

:program:`dex`, DesktopEntry Execution, is a program to generate and execute DesktopEntry files of the Application type.

Options
-------

-h, --help
        Show this help message and exit

-a, --autostart
        Autostart programs

-c PATH, --create PATH
        Create a DesktopEntry file for the program at the given path. An optional second argument is used to specify the filename of the created DesktopEntry file, or specify the filename - to print the file to stdout. By default a new file is created with the .desktop file extension.

-d, --dry-run
        Dry run, don't execute any command

-e ENVIRONMENT, --environment ENVIRONMENT
        Specify the Desktop Environment an autostart should be performed for; works only in combination with --autostart

-s SEARCHPATHS, --search-paths SEARCHPATHS
        Colon separated list of paths to search for desktop files, overriding the default search list

-t DIRECTORY, --target-directory DIRECTORY
        Create files in target directory

--term TERM
        The terminal emulator that will be used to run the program if Terminal=true is set in the desktop file, defaults to x-terminal-emulator

-w, --wait
        Block until the program exits

--test
        Perform a self-test

-v, --verbose
        Verbose output

-V, --version
        Display version information

Examples
--------

Perform an autostart/execute all programs in the autostart folders.

        :program:`dex -a`

Perform an autostart/execute all programs in the specified folders.

        :program:`dex -a -s /etc/xdg/autostart/:~/.config/autostart/`

Preview the programs would be executed in a regular autostart.

        :program:`dex -ad`

Preview the programs would be executed in a GNOME specific autostart.

        :program:`dex -ad -e GNOME`

Create a DesktopEntry for a program in the current directory.

        :program:`dex -c /usr/bin/skype`

Create a DesktopEntry for a programs in autostart directory.

        :program:`dex -t ~/.config/autostart -c /usr/bin/skype /usr/bin/nm-applet`

Execute a single program from command line and enable verbose output.

        :program:`dex -v skype.desktop`

Execute a single program (with Terminal=true in the desktop file) in gnome-terminal.

        :program:`dex --term gnome-terminal nvim.desktop`

Execute a single program and block until it exits.

        :program:`dex --wait nvim.desktop`
