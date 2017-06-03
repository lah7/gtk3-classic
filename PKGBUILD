# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

pkgname=gtk3-mushrooms
pkgver=3.22.15
pkgrel=2
pkgdesc="GTK3 library with my modifications (see README)."
url="http://www.gtk.org/"
install=gtk3.install
conflicts=(gtk3)
provides=("gtk3=$pkgver")
arch=(i686 x86_64)
license=(LGPL)
depends=(
	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
	libxcomposite libxdamage pango shared-mime-info at-spi2-atk libxkbcommon
	adwaita-icon-theme json-glib librsvg desktop-file-utils mesa
)
optdepends=(
	'gtk3-print-backends: Printing'
)
makedepends=(
	gobject-introspection libcanberra gtk-doc rest libcups glib2-docs
)
source=(
	"csd.patch"
	"file-chooser.patch"
	"icons.patch"
	"others.patch"
	"print-dialog.patch"
	"smaller-adwaita.css"

	"https://github.com/GNOME/gtk/archive/$pkgver.zip"
	"settings.ini"
	"gtk-query-immodules-3.0.hook"
)
sha256sums=(
	"b0b1cb2dc65e91acd473d7c3c966867ef9945ebf376268e41ce870e725e291c2"
	"b7d5da21262fe46275131799d3403489e803c8a303b3ee1650e88a4ddb6cae11"
	"cfb3121fb174ea8718a0dc184417338c5dfd819237e233d78bf43fb51bb06c91"
	"ac119908c6a763ece6114ae3b5cd5d8c232207ce734d975e0ada22379610fc7d"
	"be7800734fc59e49c34ee2f806738eba8b606d46ac61bc3f50fa3cc69ae594f0"
	"1784e29ce5b811ed8673a29a89903751abb8bf68b3793f2e635c99851c165245"

	"c3ab786779a6a74765a56e31aaa0fe9123feee222185f0c3ae94acfb2e61a0dd"
	"01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202"
	"de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845"
)

prepare() {
	cd "$srcdir/gtk-$pkgver/gtk"

	patch -p 3 -i "$srcdir/csd.patch"
	patch -p 3 -i "$srcdir/file-chooser.patch"
	patch -p 3 -i "$srcdir/icons.patch"
	patch -p 3 -i "$srcdir/others.patch"
	patch -p 3 -i "$srcdir/print-dialog.patch"

	cat "$srcdir/smaller-adwaita.css" >> "theme/Adwaita/gtk.css"
	cat "$srcdir/smaller-adwaita.css" >> "theme/Adwaita/gtk-dark.css"

	cd "$srcdir/gtk-$pkgver"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir/gtk-$pkgver"

	CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--enable-x11-backend --disable-schemas-compile --disable-gtk-doc-html \
		--disable-installed-tests --disable-colord  --disable-maintainer-mode \
		--disable-cups --disable-cloudprint --disable-papi --disable-man

	#https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	# Make GTK building faster by skipping tests and examples.
	IFS=; while read -r line; do
		if [[ $line = "SUBDIRS = po po-properties \$(SRC_SUBDIRS) docs m4macros build" ]]; then
			echo "SUBDIRS = po po-properties gdk gtk libgail-util modules m4macros build"
		else
			echo $line
		fi;
	done < Makefile > Makefile.modified
	mv Makefile Makefile.original
	mv Makefile.modified Makefile

	make -j 15
}

package() {
	cd "$srcdir/gtk-$pkgver"

	make -j 15 DESTDIR="$pkgdir" install
	install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
	install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
