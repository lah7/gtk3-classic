# Maintainer: Luke Horwell <code@horwell.me>
# Contributor: Jonathon Fernyhough <jonathon+m2x.dev>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://git.archlinux.org/svntogit/packages.git/plain/trunk/PKGBUILD?h=packages/gtk3

__arch_pkg_commit="a683ff63aa2c307fe73f4cc6f464791951b14f7c"
_gtkver=3.24.37

pkgbase=gtk3-classic
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=1
pkgdesc="GTK3 patched to provide a more classic experience"
url="https://github.com/lah7/gtk3-classic"
conflicts=(gtk3 gtk3-typeahead gtk3-print-backends gtk3-nocsd gtk3-nocsd-git gtk3-nocsd-legacy-git)
provides=(gtk3=$_gtkver gtk3-typeahead=$_gtkver gtk3-mushrooms=$_gtkver gtk3-print-backends
          libgtk-3.so libgdk-3.so libgailutil-3.so)
arch=(x86_64)
license=(LGPL)
depends=(
	at-spi2-atk
	atk
	cairo
	desktop-file-utils
	fribidi
	gdk-pixbuf2
	gtk-update-icon-cache
	libepoxy
	librsvg
	libxcomposite
	libxcursor
	libxdamage
	libxi
	libxinerama
	libxkbcommon
	libxrandr
	pango
	shared-mime-info
	wayland
)
optdepends=(
	'adwaita-icon-theme: default icon theme'
	'cantarell-fonts: default font'
	'colord: color management support'
	'dconf: default GSettings backend'
	'libcups: printer support in print dialog'
)
makedepends=(
	adwaita-icon-theme
	at-spi2-atk
	atk
	cairo
	cantarell-fonts
	desktop-file-utils
	fribidi
	gdk-pixbuf2
	git
	gobject-introspection
	gtk-update-icon-cache
	libcups
	libegl
	libepoxy
	libgl
	librsvg
	libxcomposite
	libxcursor
	libxdamage
	libxi
	libxinerama
	libxkbcommon
	libxrandr
	meson
	pango
	quilt
	sassc
	shared-mime-info
	wayland
	wayland-protocols
)
install=gtk3.install
source=(
	# Patch files.
	series
	appearance__buttons-menus-icons.patch
	appearance__disable-backdrop.patch
	appearance__file-chooser.patch
	appearance__fix_black_border.patch
	appearance__message-dialogs.patch
	appearance__print-dialog.patch
	appearance__smaller-statusbar.patch
	csd__clean-headerbar.patch
	csd__disabled-by-default.patch
	csd__server-side-shadow.patch
	file-chooser__places-sidebar.patch
	file-chooser__typeahead.patch
	fixes__labels-wrapping.patch
	fixes__too-large-menu-covers-bar.disabled-patch
	other__default-settings.patch
	other__hide-insert-emoji.patch
	other__mnemonics-delay.patch
	other__remove_dead_keys_underline.patch
	popovers__color-chooser.patch
	popovers__file-chooser-list.patch
	popovers__places-sidebar.patch
	notebook_wheel_scroll.patch
	treeview__alternating_row_colours.patch
	window__rgba-visual.patch

	# Theme CSS stylesheet.
	smaller-adwaita.css

	# GTK source code.
	"https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-$_gtkver.tar.xz"

	# Arch Linux package files.
	settings.ini
	"gtk-query-immodules-3.0.hook::https://raw.githubusercontent.com/archlinux/svntogit-packages/$__arch_pkg_commit/trunk/gtk-query-immodules-3.0.hook"
)
sha256sums=('d93d793e40ef013949e955088065db6599fd2228f8dafe840d794625f85e8997'
            '6de32e1bee6bf4307aaec072fc8431b044e73299720a490298b8c1b7c502e039'
            '9785368d56b851e52de00eec852fc56f636dbc66d53c74d9b102e7c060f69533'
            '760bd3d65b3c5c0be19311d3b9d2be1f33c3bec198bc470de5afe23f5d488b8f'
            '736821182ac014617006e9d00fafa807a19611f3a9032133dee91b4656b7980a'
            '00927690718c65f6b3c025e2e919028f41cd522c573964dd7fdc31b3022b983f'
            'db82bc4647eda7cc102590d5cfffd8524cf126a704358096e0e66f5c068fe46f'
            '24217b43a7ca5bd46ff205b8f2a7c5a5192cafc36f5093255ed9053e5496afed'
            '940638221f69f89e758044c37d40e2c39a14eb479afe6046c0e7e78c061e8ca2'
            'caa4da5e786a38e788617d6c9a844dfc604038d2a5d57033273859cad46d14cd'
            'cf26ab623fec6fc4f24628bdbe4b81ba5f56e8e0c61de78474d5c2411901931a'
            '6f5cfa1f3d0b1bd426e2be738b371f1910674dba8c67f4cb3de20bd55e15879e'
            'c6fd146e7ab332dd9a394b666b19e6ba7d6ac0932f33fb396f66630134257309'
            '7157b665e2ae724bb6abe8fc382d7178dc4d8d00f29bc63ed2942307ff41914b'
            '2b10b436ebcf8c124fac6e7867f0bf0573ecfb70130893fea37724c5f6719caf'
            '64c36c636c73b58afa219737a1f567c37f36df5971edf4352bf0639d907f4567'
            '974374f2799aaa48b9ded985c47d2dda45d2fcdcd63f1749e74b243279467d49'
            '9761a289cf93558ec67bb498b765ccb757027b10071da938ff14fca695a0103d'
            'b92a82568a0f5c1c897561efafb55deb2331450d53377ab230def71012d8ccfc'
            'bf0e188ba6cfb24b506e4eab7e62a020348cce307d4eecde571227a058c441ad'
            '69754da0ccb0776003f2464a7d4cd433a5d02ad99801848c7b16f1de24c6988b'
            'af2d2d4a0d876f9abc350a1cdb09ffc016a8894ee3c46030c3d90c6e99b27c5a'
            '904a819f3c484736384964b77591cae6dca17e849949f7a80d13f134a159ab32'
            '288978a65fbd0524e9194940b9b15774b010cb7193ef5bf5a4a5df3358ef9df6'
            '96ddecb48e5734159f91261c3a4b7f71a757d6aab69d22f11df600fb91511b11'
            'ba93f62e249f2713dbfe6c82de1be4ac655264d6407ed3dc5e05323027520f31'
            '6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf3d39fe9fe5fb7f57'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229')

prepare()
{
	cd gtk+-$_gtkver

	QUILT_PATCHES=.. quilt push -av

	rm -f "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/smaller-adwaita.css" | tee -a "$srcdir"/gtk+-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
	CFLAGS+=" -DG_DISABLE_CAST_CHECKS"

	# 64-bit
	arch-meson gtk+-$_gtkver build \
		-D broadway_backend=true \
		-D colord=auto \
		-D demos=true \
		-D examples=false \
		-D introspection=true \
		-D tests=false \
		-D installed_tests=false
	ninja -C build
}

package_gtk3-classic()
{
	DESTDIR="$pkgdir" meson install -C build

	install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
	install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
