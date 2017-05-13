GTK3-mushrooms
===

This is a set of patches for GTK3 library that makes it better for me and maybe for you too. ;-)
It is based on official GTK3 package from Arch Linux (but compiles GTK3 without documentation and Broadway backend).
I have not wide knowledge about programming in C, so quality of this patches can be not good.
But it works! See list of patches below.

Client Side Decorations
---

* CSDs are permanently and totally disabled. All windows are decorated only by window manager.
* Application menu button and minimize/maximize/close buttons are removed.
* Application menu is accessible as context menu of headerbar.
* Window title is not displayed on headerbar. Window subtitle is styled as window title.

File chooser
---

* "Other locations" button is removed from places sidebar. All mounted devices and drives are accessible directly.
* Annoying single-click "feature" in file list is disabled. See: https://bugzilla.gnome.org/show_bug.cgi?id=766089
* XDG user directories (like Pictures, Downloads, Documents) are removed from places sidebar. They can be added as bookmarks.

Print dialog
---

* Appearance of print dialog is less "gnomish" (natural margins are restored).
* Atril instead of Evince is set as default previewer.

General
---

* Default Adwaita theme has smaller controls (buttons, fields, tabs, etc.).
* Statusbars are smaller regardless of used theme.
* Scrollbars are always visible. Environment variable is not needed.
* Delay before showing mnemonics is removed. User do not have to wait.
* Recently opened files are disabled by default.

--------

In future
---

* Message dialogs: restore appearance like in GTK2.
* File chooser and color chooser: use classic menu instead of modern popovers in context menus.
* File chooser: restore typeahead feature in file list. See: https://aur.archlinux.org/packages/gtk3-typeahead
