# Maintainer: Jonathon Fernyhough <jonathon_at manjaro+dot_org>
# Upstream maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="dd59624b448ca6f6e48d4f1268fd3c871a20ae76"
_gtkver=3.24.20

pkgbase=gtk3-classic
pkgname=($pkgbase lib32-$pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="GTK3 patched for classic desktops like XFCE or MATE. Please see README."
url="https://github.com/lah7/gtk3-mushrooms"
conflicts=(gtk3 gtk3-typeahead gtk3-print-backends)
provides=(gtk3=$pkgver gtk3-typeahead=$pkgver gtk3-classic=$pkgver gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so)
arch=(x86_64)
license=(LGPL)
makedepends=(
	gobject-introspection libcanberra gtk-doc sassc libcups meson quilt

	atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 fribidi
	libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
	json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache
	adwaita-icon-theme cantarell-fonts

	lib32-atk lib32-cairo lib32-libxcursor lib32-libxinerama lib32-libxrandr lib32-libxi
	lib32-libepoxy lib32-gdk-pixbuf2 lib32-fribidi lib32-libxcomposite lib32-libxdamage 
	lib32-pango lib32-at-spi2-atk lib32-wayland lib32-libxkbcommon lib32-json-glib
	lib32-librsvg lib32-mesa lib32-libcups lib32-krb5 lib32-e2fsprogs
)
install=gtk3.install
source=(
	# Patch files.
	series
	appearance__buttons-menus-icons.patch
	appearance__disable-backdrop.patch
	appearance__file-chooser.patch
	appearance__message-dialogs.patch
	appearance__print-dialog.patch
	appearance__smaller-statusbar.patch
	csd__clean-headerbar.patch
	csd__disabled-by-default.patch
	csd__server-side-shadow.patch
	file-chooser__places-sidebar.patch
	file-chooser__typeahead.patch
	fixes__atk-bridge-errors.patch
	fixes__labels-wrapping.patch
	fixes__too-large-menu-covers-bar.disabled-patch
	other__default-settings.patch
	other__hide-insert-emoji.patch
	other__mnemonics-delay.patch
	popovers__color-chooser.patch
	popovers__file-chooser-list.patch
	popovers__places-sidebar.patch

	# Theme CSS stylesheet.
	smaller-adwaita.css

	# GTK source code.
	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$_gtkver.tar.xz"

	# Arch Linux package files.
	"settings.ini::https://git.archlinux.org/svntogit/packages.git/plain/trunk/settings.ini?h=packages/gtk3&id=$__arch_pkg_commit"
	"gtk-query-immodules-3.0.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/gtk-query-immodules-3.0.hook?h=packages/gtk3&id=$__arch_pkg_commit"

	README.md
)

sha256sums=('68b26360764a2ea7e057a2aaa29c6fdfe164b9987866e038d8d0188a025477fb'
            'eade303471a5929ccf6cf14ff434deccb0da017d5c4fdce3f5a3ffa117c1c954'
            '86f48054a2df6319d97db14fd17ea15d50b32ea6ba594d83e8faa1596ec657ab'
            '54020144ac0472ae170297b4158da719b49860b17234bf54351ba30f793a7fe7'
            'be4ddf03a5cce8270e8118eb331b3056972c0bd490faa6e4a4ebe332ec4c2e91'
            '81138fbaff82e37a83da1c4aa074a6c708e6c50340e0ddeff3fb70e2a0b52e1f'
            '515ff6df72934aa4294cdb1befd6c542a187fe3b4326cda68a8541dabbe657fd'
            '63bf214d836f688e628b30d1743ff9e47deb64d0f4bde9f0eb9c352fc00ca8d4'
            '1508ddc7e682cdaace327ffe2955abe90f903cf7ec923892b85673a37f76a32f'
            '8271342e6a0394f70b6e5a21afb21e2e0b645edf39a0d149d5e8b4d6b062846d'
            '7b987cc9bd7ca9722bfb881b30b082c0d7409e3cd68592f5e7a1f401d73e7672'
            '99b12d7af7efc6a014e6afcab1ee82ea0feb0b5a4e9bbd663d1c45354cd34f2b'
            '7a604d453beb9c425b8ed4a60b5e9435c3f4ee10438490641c0ade448401306a'
            '79b26a1f38e0629f344c88bc6a6d76e3b24162d5a5340e4647256229ae4e9c35'
            'acd3babd22add981690728e84a89fb8bb332b7ac746e9db7cdb27c47f1ac0042'
            'c213812e1fafeb5565f7e329c4501195f04adcfe377b88439a6d51d478edc071'
            '7f3e5da1622e243243ea9b1e487460f608dc375e79d800d2f0d826fd30be68ed'
            'd05b6727293f7735c8d06ccee4adf19bd765c50ac94b729a2660103ffd357700'
            '2de68b575494d0d034accd7cd0ce881f366d5201a48496d8748c43f297836eac'
            'ba93f62e249f2713dbfe6c82de1be4ac655264d6407ed3dc5e05323027520f31'
            '2dac69f716e8d04ba7a95091589e2baaec95dcace932cb15839163db479b1df3'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '1d2e3c41c7de03a31d717b09e053c88cbaca2ae74eefd982549c49de81c21ada')

prepare()
{
	QUILT_PATCHES=. quilt push -av

	rm -f "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/smaller-adwaita.css" | tee -a "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
	CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"

	# 64-bit
	arch-meson gtk+-$_gtkver build \
		-D broadway_backend=true \
		-D colord=no \
		-D demos=true \
		-D examples=false \
		-D tests=false \
		-D installed_tests=false
	ninja -C build

	# 32-bit
	export PKG_CONFIG_LIBDIR="/usr/lib32/pkgconfig"
	export PKG_CONFIG_PATH="/usr/share/pkgconfig"

	CFLAGS+=" -m32"
	CXXFLAGS+=" -m32"
	LDFLAGS+=" -m32"

	linux32 arch-meson gtk+-$_gtkver build32 \
		-D broadway_backend=true \
		-D colord=no \
		-D demos=false \
		-D examples=false \
		-D tests=false \
		-D installed_tests=false \
		-D libdir=/usr/lib32
	linux32 ninja -C build32
}

package_gtk3-classic()
{
	depends=(
		atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 fribidi
		libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
		json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache
	)
	optdepends=(
		'libcups: printers in printing dialog'
		'dconf: default GSettings backend'
		'libcanberra: sounds events'
		'adwaita-icon-theme: default icon theme'
		'cantarell-fonts: default font'
	)

	DESTDIR="$pkgdir" meson install -C build

	install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"

	install -Dm644 "$srcdir"/README.md "$pkgdir/usr/share/gtk-3.0/README.md"
	sed -i 's/mushrooms/classic/g' "$pkgdir/usr/share/gtk-3.0/README.md"
}

package_lib32-gtk3-classic()
{
	pkgdesc="GTK3 patched for classic desktops like XFCE or MATE. (32-bit)"
	depends=(
		lib32-atk lib32-cairo lib32-libxcursor lib32-libxinerama lib32-libxrandr lib32-libxi
		lib32-libepoxy lib32-gdk-pixbuf2 lib32-fribidi lib32-libxcomposite lib32-libxdamage 
		lib32-pango lib32-at-spi2-atk lib32-wayland lib32-libxkbcommon lib32-json-glib
		lib32-librsvg lib32-mesa lib32-libcups lib32-krb5 lib32-e2fsprogs
		"gtk3-classic>=$pkgver"
	)
	conflicts=("lib32-gtk3")
	provides=("lib32-gtk3=$pkgver")

	DESTDIR="$pkgdir" linux32 meson install -C build32

	rm -fr "$pkgdir"/etc
	rm -fr "$pkgdir"/usr/{bin,share,include}
}
