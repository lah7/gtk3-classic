# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

_arch_pkg_commit="712b5a879d9389efba706c8817607fa65ac562e9"

pkgname=gtk3-mushrooms
pkgver=3.22.24
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
	# Script applying patch.
	"do-mushrooms.sh"

	# Patch files.
	"appearance__buttons-menus-icons.patch"
	"appearance__file-chooser.patch"
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
	"settings.ini::https://git.archlinux.org/svntogit/packages.git/plain/trunk/settings.ini?h=packages/gtk3&id=$_arch_pkg_commit"
	"gtk-query-immodules-3.0.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/gtk-query-immodules-3.0.hook?h=packages/gtk3&id=$_arch_pkg_commit"
)
sha256sums=(
	'69b8efb7b61089c4ca6328dcd910fd2a31075e1774d72463adb13e44e7ea8e86'
	'da8b8cd33750d38c607b4a4c5ae5dab9bf61c58aca12a095dfe6f555d3c9cd79'
	'b978504d311fb87505e1787a07c246310e3389840082f326e266193ad908c0f1'
	'b479fe0a82db21475fde30d9daad4360552b67957479773a1216058c7ff46629'
	'7908611ae7f85a37542b1f1558f46f1d5f35fa1996551d4e61c163569ea3b0ac'
	'7a1f4259502eea2f610df3ed8f82fc929fce1ebe92422327f54aa41ddf47e7f8'
	'58eb8466a76d6d48f32ec77365dc5436334e2aab9dd9df3ab59d5d55beb591cb'
	'a97f8b588ccfd55e78bccbbfa55b3ca62d5e1732cc815852b31ba9a6fa722494'
	'831e67a278152e93561658f364a10251ed07a9d05c60828b7ec1ab933ebe67b0'
	'90fcf8ed5a40b01a2cbc5e255c05860d9960b51dda704bacfe3efe23a1b045bc'
	'4d2fdb331e105c8512d3b2ad16b8c512b372fa3c3658c6881b1f89c9d78da7fb'
	'9d07b362be00fa493642f680feeebc49cfae28f8f88c0e8c6de13b15323dacc9'
	'fdc2c3d63c0fc94934c10a99189062955e8f40acd3bb883b739faefa86344c1f'
	'dcbdf52343748b7af621e98bf12d8c76097e0eb98ef02f594f95eefc5ae72575'
	'cf1e95e4a8c9d001d919fddeab9260b39e32739fe66440138dfc70182df5297a'
	'4917fcb99dfe189f0f834a143bf85abb77f9ac0b8ec7a881aa4c8c1b897f6524'
	'64776101101b0ddc256e32a318f35526eb5e41b48aba7b7d30c39ef76db77ace'
	'e8d53849a3277fa0f0f729be2197970f28cd809070021d2f5ae1987df8250171'
	'4a239fb3f4dc128a64198ce9bcb9c4643541e366fd3fe19dfb45d23711727e18'
	'a55a56aeb72715cb6ae39e440e01ff7492e484400f6e063368b74abf59d44fdb'
	'0554ba2085fb8cec8e3b926efc250ae5c15cf47f2612c10cdd0e849bfb8d05a5'
	'cbb16e4cfc928ab8f5f22f7290616f95f6ebc8c97cc724a2007b07ced833592b'
	'01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
	'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
)

prepare()
{
	cd "$srcdir/gtk+-$pkgver"

	../do-mushrooms.sh
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
