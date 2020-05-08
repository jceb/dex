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

Autostart Alternative
---------------------

I consider ``systemd/user`` as a good alternative for ``dex``'s autostart
functionality and switched to it recently. In particular, systemd solves the
issue of ``dex`` losing control over the started processes which causes
processes to live longer than the X session which could cause additional
annoyances like reboots taking a lot of time because the system is waiting for
the processes to terminate.

The following steps will help you to get to a working ``systemd/user``
configuration:

- Create the systemd user directory: ``mkdir -p ~/.config/systemd/user``
- Create an autostart target at ``~/.config/systemd/user/autostart.target``
  with the following content::

        [Unit]
        Description=Current graphical user session
        Documentation=man:systemd.special(7)
        RefuseManualStart=no
        StopWhenUnneeded=no

- Create service files at ``~/.config/systemd/user/<service name>.service`` that
  service the same purpose as the ``<service>.desktop`` files created by
  ``dex``. The service file should have at least the following content::

        [Unit]
        Description=<service description>

        [Service]
        ExecStart=<path to the executable> [<parameters>]

  - Attention: for the service to work properly it mustn't fork. Systemd will
    take care of the service management but it can only do this when the service
    doesn't fork! If the services forks and terminates the main process, systemd
    will kill all the processes related to the service. The service will
    therefore not run at all! The man page of the service should list the
    required parameters that need to be provided to the service to avoid
    forking.

- Register a service with systemd:

      ``systemctl --user add-wants autostart.target <service name>.service``

  - Unregister a service:

      ``systemctl --user disable <service name>.service``

  - List currently active services:

      ``systemctl --user list-units``

- Finally, start all services in the autostart target during startup by
  replacing the ``dex -a`` command with:

      ``systemctl --user start autostart.target``

  - Reload all service configurations after making changes to a service file:

        ``systemctl --user daemon-reload``

  - Start a service:

        ``systemctl --user start <service name>.service``

  - Check the status of a service:

        ``systemctl --user status <service name>.service``

  - Stop a service:

        ``systemctl --user stop <service name>.service``
