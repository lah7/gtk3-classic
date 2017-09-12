# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="eb853c7714b8675246344169980ace3f4e18aac3"

pkgname=gtk3-mushrooms
pkgver=3.22.21
pkgrel=1
pkgdesc="GTK3 library with my modifications (see README)."
url="http://www.gtk.org/"
conflicts=(gtk3)
provides=("gtk3=$pkgver")
arch=(i686 x86_64)
license=(LGPL)
depends=(
	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
	libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
	json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache
)
optdepends=(
	'gtk3-print-backends: printing'
	'dconf: default GSettings backend'
	'adwaita-icon-theme: default icon theme'
	'cantarell-fonts: default font'
)
makedepends=(
	gobject-introspection libcanberra gtk-doc
)
source=(
	# Patch files.
	"csd__clean-headerbar.patch"
	"csd__disabled-by-default.patch"
	"csd__headerbar-title.patch"
	"csd__server-side-shadow.patch"
	"file-chooser__cwd-default.patch"
	"file-chooser__places-sidebar.patch"
	"file-chooser__single-click.patch"
	"file-chooser__typeahead.patch"
	"icons__buttons.patch"
	"icons__context-menus.patch"
	"icons__file-chooser.patch"
	"other__mnemonics-delay.patch"
	"other__no-at-bridge.patch"
	"other__statusbar-size.patch"
	"other__visible-scrollbar.patch"
	"popovers__color-chooser.patch"
	"popovers__file-chooser-list.patch"
	"popovers__menu-button.patch"
	"popovers__places-sidebar.patch"
	"print-dialog__appearance.patch"
	"print-dialog__default-previewer.patch"

	# Theme CSS stylesheet.
	"smaller-adwaita.css"

	# GTK source code.
	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$pkgver.tar.xz"

	# ArchLinux package files.
	"settings.ini::https://git.archlinux.org/svntogit/packages.git/plain/trunk/settings.ini?h=packages/gtk3&id=$__arch_pkg_commit"
	"gtk-query-immodules-3.0.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/gtk-query-immodules-3.0.hook?h=packages/gtk3&id=$__arch_pkg_commit"
)
sha256sums=(
	# Patch files.
	"7a1f4259502eea2f610df3ed8f82fc929fce1ebe92422327f54aa41ddf47e7f8"
	"58eb8466a76d6d48f32ec77365dc5436334e2aab9dd9df3ab59d5d55beb591cb"
	"a97f8b588ccfd55e78bccbbfa55b3ca62d5e1732cc815852b31ba9a6fa722494"
	"831e67a278152e93561658f364a10251ed07a9d05c60828b7ec1ab933ebe67b0"
	"5f6dded28c77cfbd1c58f8c334c8544fc84093124f385f87dcf05eeb045bbd8b"
	"4d2fdb331e105c8512d3b2ad16b8c512b372fa3c3658c6881b1f89c9d78da7fb"
	"9d07b362be00fa493642f680feeebc49cfae28f8f88c0e8c6de13b15323dacc9"
	"fdc2c3d63c0fc94934c10a99189062955e8f40acd3bb883b739faefa86344c1f"
	"769ad0e70a6ac01c203417e50f06d64dbc9fd260707abf5289642ca5a4d4e7f4"
	"a2af0c7f29e9ae5e2a669f4ad131acab8d5cbd5d47cc3914750db25b8eeefe1e"
	"b978504d311fb87505e1787a07c246310e3389840082f326e266193ad908c0f1"
	"cf1e95e4a8c9d001d919fddeab9260b39e32739fe66440138dfc70182df5297a"
	"103f86c0f03a1c210a56a44434c19b9f64f8c376bcead689a04919b26b0f4d4c"
	"7908611ae7f85a37542b1f1558f46f1d5f35fa1996551d4e61c163569ea3b0ac"
	"cfacf351122f95cbef5e752f8e1850ee4ff5495d3bf43732405c2a51e02a9f24"
	"64776101101b0ddc256e32a318f35526eb5e41b48aba7b7d30c39ef76db77ace"
	"e8d53849a3277fa0f0f729be2197970f28cd809070021d2f5ae1987df8250171"
	"ae3da3618e294dace5a2459a9e3bfaa3bd50be034449eec2828eaa2e217ce851"
	"a55a56aeb72715cb6ae39e440e01ff7492e484400f6e063368b74abf59d44fdb"
	"b479fe0a82db21475fde30d9daad4360552b67957479773a1216058c7ff46629"
	"23cdd8b8034e73bb852d42feaabf4f995983a032be479d9ce84e5858c0bd5c41"

	# Theme CSS stylesheet.
	"0554ba2085fb8cec8e3b926efc250ae5c15cf47f2612c10cdd0e849bfb8d05a5"

	# GTK source code.
	"1bd3c1a85cfb4db112cabb5379abb05a1a94fe43052d309d573493fca00e6b87"

	# ArchLinux package files.
	"01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202"
	"de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845"
)

__patch_makefiles()
{
	__replace_string_in_file()
	{
		sed -i".bak" "s/$1/$2/" "$3"
		[[ "$(cat "$3")" != "$(cat "$3.bak")" ]] || return 1
		rm "$3.bak"
	}

	__replace_string_in_file \
		"SRC_SUBDIRS = gdk gtk libgail-util modules demos tests testsuite examples" \
		"SRC_SUBDIRS = gdk gtk libgail-util modules demos" \
		"Makefile.am"

	__replace_string_in_file \
		"SUBDIRS = po po-properties \$(SRC_SUBDIRS) docs m4macros build" \
		"SUBDIRS = po \$(SRC_SUBDIRS) m4macros build" \
		"Makefile.am"

	__replace_string_in_file \
		"SUBDIRS = gtk-demo widget-factory icon-browser" \
		"SUBDIRS = widget-factory" \
		"demos/Makefile.am"

	__replace_string_in_file "SUBDIRS += cloudprint" "" "modules/printbackends/Makefile.am"
	__replace_string_in_file "SUBDIRS += cups" 	     "" "modules/printbackends/Makefile.am"
	__replace_string_in_file "gtk-update-icon-cache" "" "gtk/Makefile.am"
}

__patch_gtk_code()
{
	for patchfile in $srcdir/*.patch; do
		patch -d "gtk" -p 3 -i "$patchfile"
	done

	cat "$srcdir/smaller-adwaita.css" >> "gtk/theme/Adwaita/gtk-contained.css"
	cat "$srcdir/smaller-adwaita.css" >> "gtk/theme/Adwaita/gtk-contained-dark.css"
}

prepare()
{
	cd "$srcdir/gtk+-$pkgver"

	# Make building faster by skipping tests, code examples and unused elements.
	__patch_makefiles

	# Apply patches to GTK code.
	__patch_gtk_code

	NOCONFIGURE=1 ./autogen.sh
}

build()
{
	cd "$srcdir/gtk+-$pkgver"

	CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--enable-x11-backend --enable-wayland-backend --disable-schemas-compile \
		--disable-gtk-doc-html --disable-installed-tests  --disable-maintainer-mode

	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make -j 15
}

package()
{
	cd "$srcdir/gtk+-$pkgver"

	make -j 15 DESTDIR="$pkgdir" install
	install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
	install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"
}
