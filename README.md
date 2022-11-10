# gtk3-classic

_(Previously known as gtk3-mushrooms)_

[![Patched](https://img.shields.io/github/tag/lah7/gtk3-classic.svg?label=Patched)](https://github.com/lah7/gtk3-classic/releases)
[![Upstream](https://img.shields.io/archlinux/v/extra/x86_64/gtk3?label=Upstream)](https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/NEWS)
[![CI Status](https://github.com/lah7/gtk3-classic/actions/workflows/main.yml/badge.svg?branch=master&event=push)](https://github.com/lah7/gtk3-classic/actions/workflows/main.yml)

![Screenshot of some of the tweaks](.github/readme/preview.png)

This repository contains patches to restore GTK3's look & feel reminiscent to
earlier versions. With many enhancements such as disabled CSD headers,
traditional dialog boxes and file browser improvements.

These are designed to work on non-GNOME desktops (such as XFCE and MATE)
and any other environment where GTK applications are used. Running
on GNOME desktops is not recommended!

[View Screenshots](https://github.com/lah7/gtk3-classic/wiki/Screenshots)


## Arch Linux

[![AUR](https://img.shields.io/aur/version/gtk3-classic?label=AUR&logo=archlinux&logoColor=white)](https://aur.archlinux.org/packages/gtk3-classic/)

Available from the AUR under [`gtk3-classic`](https://aur.archlinux.org/packages/gtk3-classic/),
which is based on the official [`gtk3`](https://archlinux.org/packages/extra/x86_64/gtk3/) package
with some slight changes:

* These dependencies are now optional:
    * `adwaita-icon-theme` - default icon theme
    * `cantarell-fonts` - default font
    * `dconf` - default GSettings backend
    * `colord` - color management support
    * `libcups` - enable printers in print dialog
* Excludes demos, examples and tests.

Any variant of this package found in the wild is not supported.

There's a few ways to install:

* The [release notes](https://github.com/lah7/gtk3-classic/releases/latest) contains a package
built autonomously by [GitHub Actions](https://github.com/lah7/gtk3-classic/actions) for your convenience.

      sudo pacman -U ./*.tar.zst

* Use an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers), such as `yay`:

      yay -S gtk3-classic lib32-gtk3-classic

* Build from source, like so:

      git clone https://github.com/lah7/gtk3-classic
      cd gtk3-classic
      makepkg -s

If you've previously installed `gtk3-mushrooms`, switch to this new package.


## Ubuntu

[![Ubuntu](https://img.shields.io/badge/Ubuntu-ppa%3Alah7%2Fgtk3--classic-e95420?logo=ubuntu&logoColor=white)](https://launchpad.net/~lah7/+archive/ubuntu/gtk3-classic)

> Available for these releases: 20.04, 21.10, 22.04

These packages are based on the original [`gtk+3.0`](https://packages.ubuntu.com/search?section=all&arch=any&keywords=gtk%2B3.0&searchon=sourcenames)
package, with the version suffixed with `~classic`.

To install, [add the repository](https://launchpad.net/~lah7/+archive/ubuntu/gtk3-classic) and upgrade your packages:

    sudo add-apt-repository ppa:lah7/gtk3-classic
    sudo apt dist-upgrade

To restore the original GTK3, use `ppa-purge` to restore the packages from Ubuntu's repository:

    sudo apt-get install ppa-purge
    sudo ppa-purge ppa:lah7/gtk3-classic


## Gentoo

An unofficial Gentoo ebuild is available as `x11-libs/gtk3-classic-patches` in
the `khoverlay` overlay.  Rather than providing a patched `x11-libs/gtk+:3`
ebuild directly, this ebuild installs user patches which will be applied on
subsequent builds of GTK3.  This way, the latest official Gentoo GTK3 ebuild can
always be used.

To install, first add the overlay and accept the package's testing status:

    sudo eselect repository enable khoverlay
    sudo emerge --sync khoverlay
    echo 'x11-libs/gtk3-classic-patches::khoverlay' | sudo tee /etc/portage/package.accept_keywords

Then install the patches and rebuild GTK3:

    sudo emerge -av gtk3-classic-patches
    sudo emerge -av1 gtk+:3

To revert to standard GTK3, remove the patches and rebuild GTK3:

    sudo emerge -cav gtk3-classic-patches
    sudo emerge -av1 gtk+:3


## Patches

#### Client Side Decorations (only on Xorg)

* **CSDs are disabled by default.**
  * All windows are decorated only by window manager.
  * You can enable CSDs by setting `GTK_CSD=0` environment variable (or `GTK_CSD=1` to force CSDs on each GTK3 window).
* Client side shadows of windows, menus and tooltips are disabled by default.
  * You can enable shadows by setting `GTK_CSD=1` environment variable.
* Minimize, maximize and close buttons, window title and subtitle are removed from headerbar.

#### File chooser

* **Typeahead feature is restored.**
  * Recursive file search will not be ran automatically when you start typing.
  * You can still search recursively by Left <kbd>Alt</kbd> + <kbd>S</kbd> shortcut. See https://gitlab.gnome.org/GNOME/gtk/issues/839.
* "Other locations" button is removed from Places sidebar.
  * All mounted devices and drives are accessible directly.
  * "Networks" button is added for browsing network shares.
* Trash and XDG user directories (like Pictures, Downloads, Documents) are removed from Places sidebar.
  * These can be added as bookmarks.
* File System button in Places sidebar is labeled as "File System" instead of "Computer".

#### Appearance

* [Alternating row colours in treeviews are restored.](https://github.com/lah7/gtk3-classic/wiki/Treeview:-Alternating-Colours-CSS) (requires additional step)
* Message dialogs have traditional appearance with left-aligned texts and right-aligned buttons.
* Some GTK stock icons on buttons and context menus are restored.
* Regular colorized icons instead of symbolic icons are used in file chooser dialog.
* Appearance of print dialog is less "gnomish", natural margins are restored.
* Backdrop CSS state is disabled.
  * Inactive windows don't look differently.
  * You can restore backdrop state by setting `GTK_CSD=1` or `GTK_BACKDROP=1` environment variable.
* Status bars are smaller regardless of used theme.
* File chooser dialog, places sidebar and color chooser dialog use a traditional context menu instead of popover.

#### Default Settings

* Scrollbars are always visible.
  * You can enable invisible scrollbars by `GTK_OVERLAY_SCROLLING=1` environment variable.
* Current working directory is opened by default in file chooser dialog instead recently used files.
* Atril instead of Evince is set as default previewer in printing dialog.

#### Other

* The underline while typing dead keys is [removed](https://blog.gtk.org/2021/03/24/input-revisited/).
* Delay before showing mnemonics is removed. You don't have to wait when you press <kbd>Alt</kbd>.
* "Insert emoji" context menu item of entry fields is hidden.
  * You can restore it by setting `GTKM_INSERT_EMOJI` environment variable.
* Default Adwaita theme has smaller controls (buttons, fields, tabs, etc.).

#### Fixes

* Reinstate the ability to switch between standard tabs by scrolling over them, similar to GTK2.
  * This can be disabled by setting `GTK_NO_TAB_SCROLL` environment variable.
* ~~Menu bars are no longer covered by too high popup menus.~~ **(patch broken)**
  * See https://gitlab.gnome.org/GNOME/gtk/issues/1016.
* Labels are wrapped similarly to GTK2. This patch fixes too wide windows in applications improperly ported from GTK2.
* Allows windows to be transparent whenever a compositor is enabled.
  * To enable, set the `GTK_RELAX_RGBA` environment variable.
  * See https://gitlab.gnome.org/GNOME/gtk/-/issues/3105


## Problems?

These patches are unofficial and are **not supported by GTK developers,
your distribution or any applications.** If you are having trouble with an
application or theme, try reverting to the original `gtk3` to confirm
it's **definitely** a problem with these patches.

**Use Arch?** Try isolating the problematic patch by excluding them in your PKGBUILD and rebuilding.
The included `scripts/test-exclude-each-patch.sh` script can help with this.

[See Support Discussions](https://github.com/lah7/gtk3-classic/discussions/categories/help-support)
|
[View Issues](https://github.com/lah7/gtk3-classic/issues/)


## Contributing

Due to our limited knowledge with C, we'd appreciate any
help in fixing bugs caused by patches or any new contributions.

Patches should not break GTK3 or any applications, and should offer "classic"
functionality as seen in GTK2 or early versions of GTK3.

Patches are managed using `quilt`.

[How to use `quilt`](https://github.com/lah7/gtk3-classic/wiki/Creating-and-Managing-Patches)
|
[View Tasks](https://github.com/lah7/gtk3-classic/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)

Our primary packaging and testing happens on Arch. Checksums in `PKGBUILD`
need to be updated to pass the automated checks. On an Arch system, these can be
regenerated automatically:

    updpkgsums

(Provided in `pacman-contrib`)


## Community

Drop by our [Discussions](https://github.com/lah7/gtk3-classic/discussions) tab, where
you can find curated tips, chat and introductions from other classic users. There is
also a category for help & support, if you need help getting GTK related stuff working.


## License

Patches follow the same license as GTK3, which is LGPL.
