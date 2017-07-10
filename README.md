GTK3-mushrooms
===

This is a set of patches for GTK3 library that makes it better for me and maybe for you too. ;-) I have not wide knowledge about programming in C, so quality of this patches can be not good. But it works! See list of patches below.

This package is based on official GTK3 package from Arch Linux. In my version library is compiled without Broadway backend, documentation and example applications. Using this package with GNOME desktop is not recommended. It is for classic GTK-based environments like MATE or XFCE.

Client Side Decorations
---

* CSDs are permanently and totally disabled. All windows (menus, tooltips) are decorated only by window manager.
* Window title is removed from headerbar. Subtitle is added to native titlebar.
* Minimize, maximize and close buttons are removed.
* Application icon is not used on application menu button.

File chooser
---

* Annoying single-click "feature" in file list is disabled. You always have to double-click to choose file from list.
* Typeahead feature is restored. Recursive file search will not be ran when you start typing.
* Current working directory is opened by default instead of section with recently used files.
* "Other locations" button is removed from places sidebar. All mounted devices and drives are accessible directly.
* File system button in places sidebar is labeled as "File System" instead of "Computer".
* Trash and XDG user directories (like Pictures, Downloads, Documents) are removed from places sidebar. They can be added as bookmarks.

Print dialog
---

* Appearance of print dialog is less "gnomish" (natural margins are restored).
* Atril instead of Evince is set as default previewer.

Icons
---

* Some of GTK stock icons on buttons are restored. You can see it in GTK internal dialogs and in some applications.
* Context menus of text fields, links and labels have restored icons too.
* Colorized icons instead of symbolic icons are used in file chooser dialog.

Popovers
---

* File chooser dialog, places sidebar and color chooser dialog use classic menu as context menu instead of popover.
* Menus of menu buttons are displayed as classic menu instead of popover.

Others
---

* Status bars are smaller regardless of used theme.
* Scrollbars are always visible. Environment variable is not needed.
* Delay before showing mnemonics is removed. You do not have to wait.

Themes
---

* Default Adwaita theme has smaller controls (buttons, fields, tabs, etc.).
* Dark Adwaita and HighContrast themes also have reduced controls.

--------

Credits
---

* https://launchpad.net/~gnome3-team — file chooser single-click patch.
* https://aur.archlinux.org/packages/gtk3-typeahead — file chooser typeahead patch.
