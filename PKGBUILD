# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="1842b0f5f36f64944ea8941928d77468456e432e"

pkgname=gtk3-mushrooms
pkgver=3.22.19
pkgrel=1
pkgdesc="GTK3 library with my modifications (see README)."
url="http://www.gtk.org/"
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

	# Themes CSS file.
	"smaller-adwaita.css"

	# GTK source code from GitHub.
	"https://github.com/GNOME/gtk/archive/$pkgver.tar.gz"

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
	"114edc66d1453fc3dbf2314b939d135b10ad3414fd972da77c5a44534bb6c6d6"  
	"769ad0e70a6ac01c203417e50f06d64dbc9fd260707abf5289642ca5a4d4e7f4"  
	"6f37fcf05281642a3a41e9f9994be21905264daf64f6e59455586bc82e502473"  
	"e8e1a4faceff212cb9ab5d29bbf6e9f6f817cba2fcce61e7e5cd51d0f1dd33dd"  
	"cf1e95e4a8c9d001d919fddeab9260b39e32739fe66440138dfc70182df5297a"  
	"103f86c0f03a1c210a56a44434c19b9f64f8c376bcead689a04919b26b0f4d4c"  
	"7908611ae7f85a37542b1f1558f46f1d5f35fa1996551d4e61c163569ea3b0ac"  
	"cfacf351122f95cbef5e752f8e1850ee4ff5495d3bf43732405c2a51e02a9f24"  
	"64776101101b0ddc256e32a318f35526eb5e41b48aba7b7d30c39ef76db77ace"  
	"1ef8375ec4c9275e0e143a39347c931b85eaa4e393aea8ab375db759d9b8ae0f"  
	"ae3da3618e294dace5a2459a9e3bfaa3bd50be034449eec2828eaa2e217ce851"  
	"a55a56aeb72715cb6ae39e440e01ff7492e484400f6e063368b74abf59d44fdb"  
	"692b49bce7143507b5c7f176ac67266d75251088da19b282129ad11a3fab5a41"  
	"23cdd8b8034e73bb852d42feaabf4f995983a032be479d9ce84e5858c0bd5c41"  

	# Themes CSS file.
	"0b055f7437d965601fe306631fd29f56bb12018dde005d60729e3f40e85f0824"

	# GTK source code from GitHub.
	"4b86fbb917fd6242684e815482b6c495015ae86260f8919c9cb5bcdbd25a3e3f"

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
	cat "$srcdir/smaller-adwaita.css" >> "gtk/theme/HighContrast/gtk-contained.css"
	cat "$srcdir/smaller-adwaita.css" >> "gtk/theme/HighContrast/gtk-contained-inverse.css"
}

prepare()
{
	cd "$srcdir/gtk-$pkgver"

	# Make building faster by skipping tests, code examples and unused elements.
	__patch_makefiles

	# Apply patches to GTK code.
	__patch_gtk_code

	NOCONFIGURE=1 ./autogen.sh
}

build()
{
	cd "$srcdir/gtk-$pkgver"

	CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--enable-x11-backend --enable-wayland-backend --disable-schemas-compile \
		--disable-gtk-doc-html --disable-installed-tests  --disable-maintainer-mode

	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make -j 15
}

package()
{
	cd "$srcdir/gtk-$pkgver"

	make -j 15 DESTDIR="$pkgdir" install
	install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
	install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"
}
