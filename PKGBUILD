# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="ced279e9020925d34991926230a754bd1650da2f"

pkgname=gtk3-mushrooms
pkgver=3.22.26
pkgrel=3
pkgdesc="GTK3 library with my modifications (see README)."
url="http://www.gtk.org/"
conflicts=(gtk3 gtk3-print-backends)
provides=(gtk3=$pkgver gtk3-print-backends)
arch=(x86_64)
license=(LGPL)
depends=(
	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
	libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
	json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache
)
makedepends=(
	gobject-introspection libcanberra gtk-doc sassc
)
optdepends=(
	'dconf: default GSettings backend'
	'adwaita-icon-theme: default icon theme'
	'cantarell-fonts: default font'
	'libcanberra: sounds library'
	'colord: for printing backends'
	'rest: for printing backends'
	'libcups: for printing backends'
)
source=(
	# Patch files.
	"appearance__buttons-menus-icons.patch"
	"appearance__disable-backdrop.patch"
	"appearance__file-chooser.patch"
	"appearance__message-dialogs.patch"
	"appearance__print-dialog.patch"
	"appearance__smaller-statusbar.patch"
	"csd__clean-headerbar.patch"
	"csd__disabled-by-default.patch"
	"csd__headerbar-title.patch"
	"csd__server-side-shadow.patch"
	"default-settings.patch"
	"file-chooser__places-sidebar.patch"
	"file-chooser__single-click.patch"
	"file-chooser__typeahead.patch"
	"other__atk-bridge-errors.patch"
	"other__hide-insert-emoji.patch"
	"other__mnemonics-delay.patch"
	"other__window-background.patch"
	"popovers__color-chooser.patch"
	"popovers__file-chooser-list.patch"
	"popovers__menu-button.patch"
	"popovers__places-sidebar.patch"

	# Theme CSS stylesheet.
	"smaller-adwaita.css"

	# GTK source code.
	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$pkgver.tar.xz"

	# ArchLinux package files.
	"settings.ini::https://git.archlinux.org/svntogit/packages.git/plain/trunk/settings.ini?h=packages/gtk3&id=$__arch_pkg_commit"
	"gtk-query-immodules-3.0.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/gtk-query-immodules-3.0.hook?h=packages/gtk3&id=$__arch_pkg_commit"
)
sha256sums=(
	"68b26360764a2ea7e057a2aaa29c6fdfe164b9987866e038d8d0188a025477fb"
	"b2f7d5d3a784b7f833d64c2a278f1d082bec5c53b4cc19602c808223625dedeb"
	"3d4d9cac36285e19972650a33bdba815096cb256e3f0991914ed3c8c19cfb650"
	"54020144ac0472ae170297b4158da719b49860b17234bf54351ba30f793a7fe7"
	"be4ddf03a5cce8270e8118eb331b3056972c0bd490faa6e4a4ebe332ec4c2e91"
	"81138fbaff82e37a83da1c4aa074a6c708e6c50340e0ddeff3fb70e2a0b52e1f"
	"3367e93113c8ebc31244d57845c41b81e5e70a62b64faf61f216f3455d7020b5"
	"513f8d3092d8392898dbdffa57fb2e92a20ad1413161b71a2fe05ee3f5c3da58"
	"4eb430f3375b3cf50ec919b868ebff3f50a6a72f40cfaf46e6ccdfc3586833e7"
	"d3816c145d4e0bc3fe04904434b2e2cae5a04d5691693d6b0c86391f76a5bf6a"
	"37e3278dd33542b706eb9e1db56997b194a7e2f1fd729a8511369387a74b22bd"
	"f0c8cbccab2bc9743075135bd5fa74f28dca722e8e723cf46e0dfa2b004a3791"
	"0cd2cd0365cb532d25ef4587882062f230dfb09f36485c568bdf27c8534831b2"
	"7b987cc9bd7ca9722bfb881b30b082c0d7409e3cd68592f5e7a1f401d73e7672"
	"99b12d7af7efc6a014e6afcab1ee82ea0feb0b5a4e9bbd663d1c45354cd34f2b"
	"8009a7eb0e33606526fd73306cf5ade3284ba843694328b32b98b4334410996d"
	"c213812e1fafeb5565f7e329c4501195f04adcfe377b88439a6d51d478edc071"
	"3067face12ad74d664ab7951f59026c01eb8070bef007b522eb84aef1576674a"
	"7f3e5da1622e243243ea9b1e487460f608dc375e79d800d2f0d826fd30be68ed"
	"ef4fed3a364db8eb9c15c9ce0e733035722f168dc88b385df2178fc1168ada54"
	"fe421b6197b4e98254019896ec79ea6b29a2140e7950ce3018ae0e1e4047b0c0"
	"2de68b575494d0d034accd7cd0ce881f366d5201a48496d8748c43f297836eac"
	"0554ba2085fb8cec8e3b926efc250ae5c15cf47f2612c10cdd0e849bfb8d05a5"
	"61eef0d320e541976e2dfe445729f12b5ade53050ee9de6184235cb60cd4b967"
	"01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202"
	"de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845"
)

__patch_makefiles()
{
	__replace_string_in_file()
	{
		sed -i".bak" "s/$1/$2/" "$3"
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

	__replace_string_in_file \
		"gtk-update-icon-cache" \
		"" \
		"gtk/Makefile.am"
}

__patch_gtk_code()
{
	for patch_file in $srcdir/*.patch; do
		patch -d "gtk" -p 3 -i "$patch_file"
	done

	cat "$srcdir/smaller-adwaita.css" | tee -a gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
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
		--enable-x11-backend --enable-wayland-backend --disable-schemas-compile --disable-gtk-doc-html

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
