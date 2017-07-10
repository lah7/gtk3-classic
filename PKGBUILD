# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

pkgname=gtk3-mushrooms
pkgver=3.22.16
pkgrel=3
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
	'gtk3-print-backends: Printing'
)
makedepends=(
	gobject-introspection libcanberra gtk-doc rest libcups glib2-docs
)
source=(
	"p__file-chooser__cwd-default.patch"
	"p__file-chooser__places-sidebar.patch"
	"p__file-chooser__single-click.patch"
	"p__file-chooser__typeahead.patch"
	"p__headerbar__buttons.patch"
	"p__headerbar__disable-csd.patch"
	"p__headerbar__title.patch"
	"p__icons__buttons.patch"
	"p__icons__context-menus.patch"
	"p__icons__file-chooser.patch"
	"p__other__mnemonics-delay.patch"
	"p__other__scrollbar.patch"
	"p__other__statusbar.patch"
	"p__popovers__color-chooser.patch"
	"p__popovers__file-chooser.patch"
	"p__popovers__menu-button.patch"
	"p__popovers__places-sidebar.patch"
	"p__print-dialog__appearance.patch"
	"p__print-dialog__previewer.patch"

	"smaller-adwaita.css"

	"https://github.com/GNOME/gtk/archive/$pkgver.zip"
	"settings.ini"
	"gtk-query-immodules-3.0.hook"
)
sha256sums=(
	"da49c43e1b8c53b0fb3a6309f18668952ca7128a4fdcfb97098a7ec9959b1fc6"
	"0615c4aec2ee47d79eee3a27e73b8156e927479c6ee4f1f165e5aaed98a01284"
	"79e69afe150a0393be17f1f8fc65c7c10540ef631a6ea657b01eaf0a99f5ffc5"
	"a38bed449757a21a476f0d5f32ad46cefa1793387784e5908da3029a891617c4"
	"49c9847239511c2db0be46cb8f660c2c4a43a45b3deed4443eb449daf9ceaf21"
	"1eac1a085ec83e4c340cdbe97d146e902497115ca29b8278eb645e0b7fce352e"
	"0439a24d7dbc1eba24fa75026f92da00c2b173cb5ccde6318629ffb191692d8d"
	"267995c5aa0541d6d75b0e9c3190c0f63cbf0c18e533997b5ae77318584cad46"
	"e120514e4f6f3658e40dc425d4c57f4f62c8007d1210f546a96083ccab87b7d0"
	"f7d4dc007352b6f04bef467420fb8b3ed43fbef3cc5928370f926ce22af93ab3"
	"ccc9ecc561c56e470a4dced055bafd6ae108c6b86e2a56f965a14afe04d35f62"
	"cd6967c6b46581752b2587a6e294950065187e10606987d71b8422b2370ca755"
	"d7855f0122bb10f96463433bf60481e2a9d5f435e6618d72254454973872411d"
	"66ad760507ff8da2578bce5cbba933e201995b29a0bc26435b4eb63e6454ef44"
	"4e273cf475f73f52c885ea41d2c72ddd1c0c466b323265f35e084c0038cb9a06"
	"f33c1fc18a02eb04a91be6218642ffd7cfa7bfc2c4c1656c413eb78d904862cf"
	"9a5d45d9f0b4c41d2255b042ebc8efe57d3fd096048125c14bc4d95fc83fbf24"
	"9dd136016d59b7b3fe8746c722a6adb9f30aa1dcbf5bf37f0055bb1af5e4d27c"
	"65d8e125c74798d2a1d1e872ee4332b3a3f6332d8860963e9f3e4c8c6f41cb92"

	"0afbd995148ce6e03010b572d69533e4d250a2e5f60323422b16a407ff162885"

	"5c2a5b99baaf48b8edd548f6ab2fbbd1437c8dc99c0837d345fb41da27d27af8"
	"01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202"
	"de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845"
)

prepare() {
	cd "$srcdir/gtk-$pkgver/gtk"

	for patchfile in $srcdir/p__*.patch; do
		patch -p 3 -i "$patchfile"
	done

	cat "$srcdir/smaller-adwaita.css" >> "theme/Adwaita/gtk-contained.css"
	cat "$srcdir/smaller-adwaita.css" >> "theme/Adwaita/gtk-contained-dark.css"
	cat "$srcdir/smaller-adwaita.css" >> "theme/HighContrast/gtk-contained.css"
	cat "$srcdir/smaller-adwaita.css" >> "theme/HighContrast/gtk-contained-inverse.css"

	cd "$srcdir/gtk-$pkgver"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir/gtk-$pkgver"

	CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--enable-x11-backend --enable-wayland-backend --disable-schemas-compile --disable-gtk-doc-html \
		--disable-man --disable-installed-tests --disable-colord  --disable-maintainer-mode

	#https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	# Make GTK building faster by skipping tests and examples.
	compatible="no"
	IFS=; while read -r line; do
		if [[ $line = "SUBDIRS = po po-properties \$(SRC_SUBDIRS) docs m4macros build" ]]; then
			echo "SUBDIRS = po gdk gtk libgail-util modules m4macros build"
			compatible="yes"
		else
			echo $line
		fi;
	done < Makefile > Makefile.modified
	mv Makefile Makefile.original
	mv Makefile.modified Makefile
	if [[ $compatible = "no" ]]; then
		echo "Makefile is not compatible."
		exit 1
	fi

	make -j 15
}

package() {
	cd "$srcdir/gtk-$pkgver"

	make -j 15 DESTDIR="$pkgdir" install
	install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
	install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
	rm `find "$pkgdir/usr/lib/gtk-3.0/3.0.0/printbackends/"* | grep -v "\-lpr.so" | grep -v "\-file.so"`
}
