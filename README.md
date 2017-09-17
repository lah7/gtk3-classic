GTK3-mushrooms
===

This is a set of patches for GTK3 library that makes it better for me and maybe for you too. ;-) I haven't wide knowledge about programming in C, so quality of this patches can be not good. But it works! See list of patches below.

This package is based on official GTK3 package from Arch Linux. In my version library is compiled without Broadway backend, documentation and example applications. Using this package with GNOME desktop is not recommended. It's for classic GTK-based environments like MATE or XFCE.

Client Side Decorations
---

* CSDs are totally disabled by default. All windows are decorated only by window manager. You can enable CSDs by setting `GTK_CSD=0` environment variable (or `GTK_CSD=1` to force CSDs on each GTK3 window).
* Client side shadows of windows, menus and tooltips are disabled by default. You can enable shadows by setting `GTK_CSD=1` environment variable.
* Window title and subtitle are removed from headerbar. Subtitle is added to native titlebar.
* Minimize, maximize and close buttons are removed from headerbar. Application menu button has changed icon.

File chooser
---

* Annoying single-click "feature" in file list is disabled. You always have to double-click to choose file from list. See https://bugzilla.gnome.org/show_bug.cgi?id=758065.
* Typeahead feature is restored. Recursive file search will not be ran automatically when you start typing. You can still search recursively by Left Alt + S shortcut. See https://bugzilla.gnome.org/show_bug.cgi?id=784029.
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

* Some GTK stock icons on buttons are restored. You can see it in GTK internal dialogs and in some applications.
* Context menus of text fields, links and labels have restored icons too.
* Regular colorized icons instead of symbolic icons are used in file chooser dialog.

Popovers
---

* File chooser dialog, places sidebar and color chooser dialog use classic menu as context menu instead of popover.
* Menus of menu buttons are displayed as classic menu instead of popover.

Others
---

* Status bars are smaller regardless of used theme.
* Scrollbars are always visible. You can enable invisible scrollbars by `GTK_OVERLAY_SCROLLING=1` environment variable.
* Delay before showing mnemonics is removed. You don't have to wait when you press Left Alt button.

Fixes
---

* Window background is set properly to theme background color instead of solid black. See https://bugzilla.gnome.org/show_bug.cgi?id=771708.
* Errors in console output about disabled integration with Accessibility Toolkit are hidden. See https://unix.stackexchange.com/questions/230238.

Adwaita theme
---

* Default Adwaita theme have smaller controls (buttons, fields, tabs, etc.).
* Message dialogs have more natural appearance.
* Dashed lines on edges of scrolled boxes are removed. See https://wiki.archlinux.org/index.php/GTK+#Disable_overlay_scrollbars.

--------

Credits
---

* https://launchpad.net/~gnome3-team — file chooser single-click patch.
* https://aur.archlinux.org/packages/gtk3-typeahead — file chooser typeahead patch.
* https://bugzilla.gnome.org/show_bug.cgi?id=757104#c0 — window background patch.
