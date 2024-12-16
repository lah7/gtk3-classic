# gtk3-classic

[![Patched](https://img.shields.io/github/tag/lah7/gtk3-classic.svg?label=Patched)](https://github.com/lah7/gtk3-classic/releases)
[![Upstream](https://img.shields.io/archlinux/v/extra/x86_64/gtk3?label=Upstream)](https://gitlab.gnome.org/GNOME/gtk/-/blob/gtk-3-24/NEWS)
[![CI Status](https://github.com/lah7/gtk3-classic/actions/workflows/main.yml/badge.svg?branch=master&event=push)](https://github.com/lah7/gtk3-classic/actions/workflows/main.yml)

![Screenshot of some of the tweaks](.github/readme/preview.png)

This repository contains patches to restore GTK 3's look & feel reminiscent to
earlier versions. With many enhancements such as disabled CSD headers,
traditional dialog boxes and file browser improvements.

These are designed to work on non-GNOME desktops (such as XFCE and MATE)
and any other environment where GTK applications are used. Running
on GNOME desktops is not recommended!

[View Screenshots](https://github.com/lah7/gtk3-classic/wiki/Screenshots) |
[View Wiki](https://github.com/lah7/gtk3-classic/wiki)


## About

Once known as `gtk3-mushrooms`, this repository is a collection of patches
that apply on top of the GTK 3 source code. It's not a fork of GTK 3.

This repository acts as a central hub for these patches and will keep rolling
if there's a new GTK 3 release. The patches aim to bring a bit of reminiscence
to GTK 2 and GTK 3's early days (hence, "classic")

**This repository is provided as-is, with no warranty or guaranteed support.**
While the patched installation should just work, you are entering unsupported tertiary.

[View Patches](#patches)


## Download

* [Arch Linux](#arch-linux)
* [Gentoo](#gentoo)
* [Ubuntu (LTS)](#ubuntu) (discontinued)

### Arch Linux

[![AUR](https://img.shields.io/aur/version/gtk3-classic?label=AUR&logo=archlinux&logoColor=white)](https://aur.archlinux.org/packages/gtk3-classic/)

Available from the AUR under [`gtk3-classic`](https://aur.archlinux.org/packages/gtk3-classic/) (previously `gtk3-mushrooms`)

Based on the official [`gtk3`](https://archlinux.org/packages/extra/x86_64/gtk3/) package
with some changes to make the package more lightweight:

* Demos, examples and tests excluded.
* Some dependencies made optional:
    * `adwaita-icon-theme` - default icon theme
    * `cantarell-fonts` - default font
    * `dconf` - default GSettings backend
    * `colord` - color management support
    * `libcups` - enable printers in print dialog

There's a few ways to install:

* The [release notes](https://github.com/lah7/gtk3-classic/releases/latest) contains a package
built autonomously by [GitHub Actions](https://github.com/lah7/gtk3-classic/actions) for your convenience.

      sudo pacman -U ./*.tar.zst

* Use an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers), such as `yay`:

      yay -S gtk3-classic

    > The [AUR's PKGBUILD](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gtk3-classic) follows this repository's [latest release](https://github.com/lah7/gtk3-classic/releases) as its source.

* Build from source:

      git clone https://github.com/lah7/gtk3-classic
      cd gtk3-classic
      makepkg -s

    > This [repository's PKGBUILD](https://github.com/lah7/gtk3-classic/blob/master/PKGBUILD) allows for selectively choosing patches.


### Ubuntu

> [!WARNING]
> Ubuntu packages for gtk3-classic has been discontinued.
> The existing PPA will continue to work, but no new packages will be created.
> **Use at your own risk.**
>
> [You may build them yourself](https://github.com/lah7/gtk3-classic/wiki/Ubuntu-Packaging) or contribute improvements to reliably build locally via our [create-ubuntu-package.sh](scripts/create-ubuntu-package.sh) script.

> [!NOTE]
> **Only available for LTS releases:** 20.04, 22.04, 24.04

These packages are based on the original [`gtk+3.0`](https://packages.ubuntu.com/search?section=all&arch=any&keywords=gtk%2B3.0&searchon=sourcenames)
package, with the version suffixed with `~classic`. These packages are rarely
updated, as they are patched against the GTK 3 version originally used for that release.

To install, [add the repository](https://launchpad.net/~lah7/+archive/ubuntu/gtk3-classic) and upgrade your packages:

    sudo add-apt-repository ppa:lah7/gtk3-classic
    sudo apt dist-upgrade

To restore the original GTK 3, use `ppa-purge` to restore the packages from Ubuntu's repository:

    sudo apt-get install ppa-purge
    sudo ppa-purge ppa:lah7/gtk3-classic

This works for stock Ubuntu. If you're using an Ubuntu derivative (like Linux Mint), you may need to
[manually downgrade packages](https://github.com/lah7/gtk3-classic/issues/116#issuecomment-2439990293) instead.


## Gentoo

A Gentoo ebuild is available as `x11-libs/gtk3-classic-patches` in
the `khoverlay` overlay.  Rather than providing a patched `x11-libs/gtk+:3`
ebuild directly, this ebuild installs user patches which will be applied on
subsequent builds of GTK 3.  This way, the latest official Gentoo GTK 3 ebuild can
always be used.

To install, first add the overlay and accept the package's testing status:

    sudo eselect repository enable khoverlay
    sudo emerge --sync khoverlay
    echo 'x11-libs/gtk3-classic-patches::khoverlay' | sudo tee -a /etc/portage/package.accept_keywords

Then install the patches and rebuild GTK 3:

    sudo emerge -av gtk3-classic-patches
    sudo emerge -av1 gtk+:3

To revert to standard GTK 3, remove the patches and rebuild GTK 3:

    sudo emerge -cav gtk3-classic-patches
    sudo emerge -av1 gtk+:3


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
* The eject button in the Places sidebar can be hidden by setting `gtk-file-chooser-eject-button=false` in `settings.ini`.

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


## Problems?

These patches are for your own pleasure. They are **not supported by GTK developers,
your distribution or application developers**. Please don't send bug reports to
them because of this patched GTK 3 installation.

If you are having trouble with an application or theme, try:

* Setting `GTK_CSD=0` environment variable, then run the application.
* Revert to the original `gtk3` to confirm these patches caused the problem.

If a patch is at fault, Arch and Gentoo users for instance can comment out (`#`)
patches in `series` until they find the one causing it.

Arch users can use the included `scripts/test-exclude-each-patch.sh` script.
It'll exclude one patch at a time and create builds using the `PKGBUILD` in this repository.


## Contributing

We're not writing new patches — only maintaining what we've got.

You are welcome to open a pull request with a new patch [or fix](https://github.com/lah7/gtk3-classic/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22) if:

* It does not break GTK 3 or any GTK applications.
* Offers "classic" functionality remensiant of GTK 2 or early versions of GTK 3.
* Optional behind an environment variable if it introduces a significant change.

Patches should be added using the `quilt` system.

[How to use `quilt`](https://github.com/lah7/gtk3-classic/wiki/Creating-and-Managing-Patches)

Our primary packaging and testing happens on Arch. Checksums in `PKGBUILD`
need to be updated to pass the automated checks. On an Arch system, these can be
regenerated automatically:

    updpkgsums

(Provided in `pacman-contrib`)

If you're not using Arch Linux, don't worry! When you create the pull request
and automated checks run, it'll fail ❌ and present a patch of required changes.


## Community

The [Discussions](https://github.com/lah7/gtk3-classic/discussions) tab
is where you can find curated tips, chat, support and introductions from other users.

XFCE users might be interested in this additional patch for the file chooser:

* https://github.com/lah7/gtk3-classic/pull/94/files
* https://aur.archlinux.org/packages/gtk3-classic-xfce (for Arch Linux users)


## License

Patches follow the same license as [GTK 3](https://gitlab.gnome.org/GNOME/gtk/-/commits/gtk-3-24), which is [LGPLv2](https://gitlab.gnome.org/GNOME/gtk/-/blob/main/COPYING?ref_type=heads).
