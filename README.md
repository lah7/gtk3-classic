GTK3-mushrooms
===

This is a set of patches for GTK3 library that makes it better for me and maybe for you too. ;-) I have not wide knowledge about programming in C, so quality of this patches can be not good. But it works! See list of patches below.

This package is based on official GTK3 package from Arch Linux. In my version library is compiled without Broadway backend, Wayland support, documentation and example applications. I do not recommend using this package with GNOME desktop. It is for classic GTK-based environments like MATE or XFCE.

Client Side Decorations
---

* CSDs are permanently and totally disabled. All windows (menus, tooltips) are decorated only by window manager.
* Window title is not displayed on headerbar. Window subtitle is styled as window title.
* Minimize, maximize and close buttons are removed.
* Application icon is not used on application menu button to avoid duplication of icon from native titlebar.

File chooser
---

* Annoying single-click "feature" in file list is disabled. You always have to double-click to choose file from list.
* Typeahead feature is restored. Recursive file search will not be ran when you start typing.
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

Others
---

* Default Adwaita theme has smaller controls (buttons, fields, tabs, etc.).
* Status bars are smaller regardless of used theme.
* Scrollbars are always visible. Environment variable is not needed.
* Delay before showing mnemonics is removed. You do not have to wait.
* Menus of menu buttons are displayed as classic menu by default instead of popover.
* Recently opened files feature is disabled by default.

--------

In future
---

* File chooser: less "gnomish" appearance, like in GTK2.
* File chooser and color chooser: use classic menu instead of popovers as context menus.
* Message dialogs: restore classic appearance like in GTK2.
* Context menus: restore icons in some places.
* Dialogs: use standard icons instead of symbolic icons in some places.

Credits
---

* https://launchpad.net/~gnome3-team — file chooser single-click patch.
* https://aur.archlinux.org/packages/gtk3-typeahead — file chooser typeahead patch.