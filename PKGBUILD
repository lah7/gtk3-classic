# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package. 
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

pkgname=gtk3-mushrooms
pkgver=3.22.15
pkgrel=1
pkgdesc="GTK3 library with my modifications (see README)."
url="http://www.gtk.org/"
install=gtk3.install
conflicts=(gtk3)
provides=("gtk3=$pkgver")
arch=(i686 x86_64)
license=(LGPL)
depends=(
	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
	libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
	adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
)
optdepends=(
	'libcanberra: gtk3-widget-factory demo'
	'gtk3-print-backends: Printing'
)
makedepends=(
	gobject-introspection libcanberra gtk-doc git colord rest libcups glib2-docs
)
source=(
	"csd.patch"
	"file-chooser.patch"
	"print-dialog.patch"
	"general.patch"
	"smaller-adwaita.css"

	"https://github.com/GNOME/gtk/archive/$pkgver.zip"
	"settings.ini"
	"gtk-query-immodules-3.0.hook"
)
sha256sums=(
	"0578c66a82b72dedf2fb5bc9c34c7218f73e40d32aa080ecdc5d4d545434df8a"
	"cf284c35f6726a9d742bd701dde7541072021b0a02e0edf3dfac0ffce9304b41"
	"77754d974a35797aae3c3513bf2a350ea207f8e8c5e02d4a2edbd162a3289e5a"
	"d551b4d0710f680374298756171ecc2d6047e0660fd575de4e69cfbb2a19cd3d"
	"1784e29ce5b811ed8673a29a89903751abb8bf68b3793f2e635c99851c165245"

	"c3ab786779a6a74765a56e31aaa0fe9123feee222185f0c3ae94acfb2e61a0dd"
	"01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202"
	"de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845"
)

prepare() {
	cd "$srcdir/gtk-$pkgver/gtk"
	
	patch -p 3 -i "$srcdir/csd.patch"
	patch -p 3 -i "$srcdir/file-chooser.patch"
	patch -p 3 -i "$srcdir/print-dialog.patch"
	patch -p 3 -i "$srcdir/general.patch"
	
	cat "$srcdir/smaller-adwaita.css" >> "theme/Adwaita/gtk.css"
	cat "$srcdir/smaller-adwaita.css" >> "theme/Adwaita/gtk-dark.css"

	cd "$srcdir/gtk-$pkgver"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir/gtk-$pkgver"

	CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--disable-schemas-compile --enable-x11-backend --enable-wayland-backend

	#https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make
}

package() {
	cd "$srcdir/gtk-$pkgver"

	make DESTDIR="$pkgdir" install
	install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
	install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
	rm `find "$pkgdir/usr/lib/gtk-3.0/3.0.0/printbackends/"* | grep -v "\-lpr.so" | grep -v "\-file.so"`
}
