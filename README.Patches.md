## Patches

#### Client Side Decorations (only on Xorg)

* **CSDs are disabled by default**
  * Allows the window manager to decorate windows instead of the application.
  * This **does not work** for all (usually, newer) GTK applications [(#32)](https://github.com/lah7/gtk3-classic/issues/32)
  * If the app looks broken, set the environment variable `GTK_CSD=0` per app (or in your desktop environment) to restore CSDs.
  * It is possible to set `GTK_CSD=1` to force CSDs on each GTK 3 window.
* Client side shadows of windows, menus and tooltips are disabled by default.
  * You can enable shadows by setting `GTK_CSD=1` environment variable.
* Minimize, maximize and close buttons, window title and subtitle are removed from headerbar.

#### File Chooser

* **Typeahead feature is restored.**
  * Recursive file search will not be ran automatically when you start typing.
  * You can still search recursively by Left <kbd>Alt</kbd> + <kbd>S</kbd> shortcut. See https://gitlab.gnome.org/GNOME/gtk/issues/839.
* Current working directory is opened by default instead recently used files.
* "Other locations" button is removed from Places sidebar.
  * All mounted devices and drives are accessible directly.
  * "Networks" button is added for browsing network shares.
* Trash and XDG user directories (like Pictures, Downloads, Documents) are removed from Places sidebar.
  * These can be added as bookmarks.
* File System button in Places sidebar is labeled as "File System" instead of "Computer".
* The eject button in the Places sidebar can be hidden by setting `gtk-file-chooser-eject-button=false` in `settings.ini`.
* IEC units (1024 bytes) can be forced using `GTK_USE_IEC_UNITS=1`. The default is SI units (1000 bytes) as GNOME HIG [previously recommended](https://bugzilla.gnome.org/show_bug.cgi?id=309850#c2).

#### Appearance

* [Alternating row colours in treeviews are restored.](https://github.com/lah7/gtk3-classic/wiki/Treeview:-Alternating-Colours-CSS) (requires additional step)
* Message dialogs have traditional appearance with left-aligned texts and right-aligned buttons.
* Some GTK stock icons on buttons and context menus are restored.
* Regular colorized icons instead of symbolic icons are used in file chooser dialog.
* Appearance of print dialog is less "gnomish", natural margins are restored.
* Backdrop CSS state is disabled.
  * Inactive windows don't look differently.
  * You can restore backdrop state by setting `GTK_BACKDROP=1` environment variable.
* Status bars are smaller regardless of used theme.
* File chooser dialog, places sidebar and color chooser dialog use a traditional context menu instead of popover.

#### Default Settings

* Scrollbars are always visible.
  * You can enable invisible scrollbars by `GTK_OVERLAY_SCROLLING=1` environment variable.
* Atril instead of Evince is set as default previewer in printing dialog.

#### Other

* The underline while typing dead keys is [removed](https://blog.gtk.org/2021/03/24/input-revisited/).
* Delay before showing mnemonics is removed. You don't have to wait when you press <kbd>Alt</kbd>.
* "Insert emoji" context menu item of entry fields is hidden.
  * You can restore it by setting `GTKM_INSERT_EMOJI` environment variable.
* Default Adwaita theme has smaller controls (buttons, fields, tabs, etc.).

#### Fixes

* Reinstate the ability to switch between standard tabs by scrolling over them, similar to GTK 2.
  * This can be disabled by setting `GTK_NO_TAB_SCROLL` environment variable.
* ~~Menu bars are no longer covered by too high popup menus.~~ **(patch broken)**
  * See https://gitlab.gnome.org/GNOME/gtk/issues/1016.
* Labels are wrapped similarly to GTK 2. This patch fixes too wide windows in applications improperly ported from GTK 2.
* Allows windows to be transparent whenever a compositor is enabled.
  * To enable, set the `GTK_RELAX_RGBA` environment variable.
  * See https://gitlab.gnome.org/GNOME/gtk/-/issues/3105
* Remove hardcoded "gtk-dialogs-use-header" setting under Wayland [(#93)](https://github.com/lah7/gtk3-classic/pull/93)
* The _primary selection_ is no longer cleared when deselecting text.
  * This refers to an X.org feature that lets you middle click to paste the last highlighted text at the mouse pointer's position. This is separate from your main clipboard (CTRL+C, CTRL+V).
  * This makes GTK consistent with other toolkits.
  * See https://gitlab.gnome.org/GNOME/gtk/-/issues/317

#### Build time

* `atk-bridge` can be optionally disabled. [(#101)](https://github.com/lah7/gtk3-classic/pull/101)
  * Similar to how you could build with `--without-atk-bridge` over a decade ago.
  * This would remove support for accessibility features; some apps could break.
  * Allows for D-Bus to be an optional dependency. [(#40)](https://github.com/lah7/gtk3-classic/issues/40)
  * To build without this feature, set meson option `atk_bridge` to `false` (default: `true`) and remove the dependencies from your package accordingly.
    * For Arch, here's a reference of [PKGBUILD changes to make](https://github.com/lah7/gtk3-classic/issues/110#issuecomment-2098950276). The ATK packages are only used as build dependencies, but can be uninstalled afterwards.
