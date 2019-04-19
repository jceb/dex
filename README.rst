dex
===

Synopsis
--------

**dex** [*options*] [*DesktopEntryFile*]...

Description
-----------

``dex``, DesktopEntry Execution, is a program to generate and execute DesktopEntry files of the Application type.

Options
-------

+------------------------------------+------------------------------------------------------------+
| Option                             | Description                                                |
+====================================+============================================================+
| -h, --help                         | Show a help message and exit                               |
+------------------------------------+------------------------------------------------------------+
| -a, --autostart                    | Autostart programs                                         |
+------------------------------------+------------------------------------------------------------+
| -c, --create PATH                  | Create a DesktopEntry file for the program at the given    |
|                                    | path. An optional second argument is used to specify the   |
|                                    | filename of the created DesktopEntry file,or specify the   |
|                                    | filename - to print the file to stdout. By default a new   |
|                                    | file is createdwith the .desktop file extension.           |
+------------------------------------+------------------------------------------------------------+
| -d, --dry-run                      | Dry run, don't execute any command                         |
+------------------------------------+------------------------------------------------------------+
| -e, --environment ENVIRONMENT      | Specify the Desktop Environment an autostart should be     |
|                                    | performed for; works only in combination with -a           |
+------------------------------------+------------------------------------------------------------+
| -s, --search-paths SEARCHPATHS     | Colon separated list of paths to search for desktop files, |
|                                    | overriding the default search list                         |
+------------------------------------+------------------------------------------------------------+
| -t, --target-directory ENVIRONMENT | Create files in target directory                           |
+------------------------------------+------------------------------------------------------------+
| --term TERM                        | The terminal emulator that will be used to run the program |
|                                    | if Terminal=true is set in the desktop file, defaults to   |
|                                    | x-terminal-emulator.                                       |
+------------------------------------+------------------------------------------------------------+
| -w, --wait                         | Block until the program exits.                             |
+------------------------------------+------------------------------------------------------------+
| --test                             | Perform a self-test                                        |
+------------------------------------+------------------------------------------------------------+
| -v, --verbose                      | Verbose output                                             |
+------------------------------------+------------------------------------------------------------+
| -V, --version                      | Display version information                                |
+------------------------------------+------------------------------------------------------------+

Examples
--------

Perform an autostart/execute all programs in the autostart folders.

        ``dex -a``

Perform an autostart/execute all programs in the specified folders.

        ``dex -a -s /etc/xdg/autostart/:~/.config/autostart/``

Preview the programs would be executed in a regular autostart.

       ``dex -ad``

Preview the programs would be executed in a GNOME specific autostart.

       ``dex -ad -e GNOME``

Create a DesktopEntry for a program in the current directory.

       ``dex -c /usr/bin/skype``

Create a DesktopEntry for a programs in autostart directroy.

       ``dex -t ~/.config/autostart -c /usr/bin/skype /usr/bin/nm-applet``

Execute a single program from command line and enable verbose output.

       ``dex -v skype.desktop``

Execute a single program (with Terminal=true in the desktop file) in gnome-terminal.

        ``dex --term gnome-terminal nvim.desktop``

Execute a single program and block until it exits.

        ``dex --wait nvim.desktop``