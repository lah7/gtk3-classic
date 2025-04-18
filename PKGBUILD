# Maintainer: Luke Horwell <code@horwell.me>
# Contributor: Jonathon Fernyhough <jonathon+m2x.dev>
# Contributor: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of GTK3 package.
# https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/commits/main

__arch_pkg_commit="e0434db23575c4c87b7232cbf6b2b42cfb6437d7"
_gtkver=3.24.49

pkgbase=gtk3-classic
pkgname=($pkgbase)
pkgver=${_gtkver}
pkgrel=2
pkgdesc="Patched GTK+3 that provides a more classic experience"
url="https://github.com/lah7/gtk3-classic"
conflicts=(
	gtk3
	gtk3-typeahead
	gtk3-print-backends
	gtk3-nocsd
	gtk3-nocsd-git
	gtk3-nocsd-legacy-git
)
provides=(
	gtk3=$_gtkver
	gtk3-typeahead=$_gtkver
	gtk3-mushrooms=$_gtkver
	gtk3-print-backends
	libgtk-3.so
	libgdk-3.so
	libgailutil-3.so
)
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
	at-spi2-core
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
	cantarell-fonts
	git
	glib2-devel
	gobject-introspection
	hicolor-icon-theme
	libcups
	libegl
	libgl
	meson
	python-packaging
	quilt
	sassc
	wayland-protocols
)
install=gtk3.install
source=(
	# Patch files.
	series
	*.patch

	# Theme CSS stylesheet.
	smaller-adwaita.css

	# GTK source code.
	"https://gitlab.gnome.org/GNOME/gtk/-/archive/$_gtkver/gtk-$_gtkver.tar.gz"

	# Arch Linux package files.
	settings.ini
	"gtk-query-immodules-3.0.hook::https://gitlab.archlinux.org/archlinux/packaging/packages/gtk3/-/raw/$__arch_pkg_commit/gtk-query-immodules-3.0.hook"
)
sha256sums=('c115b411f5d1f227b4798609d73a552b4486a4389490b6947738af74e98012c9'
            '5723d1d2c0e69ce2e7f36973560a2297f6288e1fdfa4f6946104347080c7fc8c'
            '9785368d56b851e52de00eec852fc56f636dbc66d53c74d9b102e7c060f69533'
            '760bd3d65b3c5c0be19311d3b9d2be1f33c3bec198bc470de5afe23f5d488b8f'
            '736821182ac014617006e9d00fafa807a19611f3a9032133dee91b4656b7980a'
            '0da7fabf10ba9419ce50c81341fc9c4e92c4beab73d511575507bdc0c40d033f'
            'db82bc4647eda7cc102590d5cfffd8524cf126a704358096e0e66f5c068fe46f'
            '24217b43a7ca5bd46ff205b8f2a7c5a5192cafc36f5093255ed9053e5496afed'
            '940638221f69f89e758044c37d40e2c39a14eb479afe6046c0e7e78c061e8ca2'
            'caa4da5e786a38e788617d6c9a844dfc604038d2a5d57033273859cad46d14cd'
            'cf26ab623fec6fc4f24628bdbe4b81ba5f56e8e0c61de78474d5c2411901931a'
            'ffd9112691b890e263e3eafec71c9838e215c41e6dfd4750e1a498332afbf8f4'
            '11ef5e70b610e86ab0dcf97a06833977af15f2755c3623e01ac61d8d4a5cf88b'
            '6f5cfa1f3d0b1bd426e2be738b371f1910674dba8c67f4cb3de20bd55e15879e'
            'c6fd146e7ab332dd9a394b666b19e6ba7d6ac0932f33fb396f66630134257309'
            '7157b665e2ae724bb6abe8fc382d7178dc4d8d00f29bc63ed2942307ff41914b'
            '135defcbaa4832ae09c79d39231f327c1399159c1a7520c2ebfd2ca5d7fc9a7b'
            '0e62c79e03b761e632a1178173439ffe86b99f759fc85f9f15f2c928b305e95d'
            '96c5dc456821ab4d1e40be3fdcfcaa2dab62fa0e058a622a379cc40fcad56091'
            '364e1434fc99aef3c59180982af769c9e96ec0bec4e0cf272b7d1b0a2b566fb7'
            '9423d26ff2791c7a4f3c1f0d7eeda9132ebaa69266f5e7e8770588233a674bbb'
            '904a819f3c484736384964b77591cae6dca17e849949f7a80d13f134a159ab32'
            '64c36c636c73b58afa219737a1f567c37f36df5971edf4352bf0639d907f4567'
            '974374f2799aaa48b9ded985c47d2dda45d2fcdcd63f1749e74b243279467d49'
            '9761a289cf93558ec67bb498b765ccb757027b10071da938ff14fca695a0103d'
            'b92a82568a0f5c1c897561efafb55deb2331450d53377ab230def71012d8ccfc'
            'bf0e188ba6cfb24b506e4eab7e62a020348cce307d4eecde571227a058c441ad'
            'ba31709dad005ac06a86222ee6ead41175d88f8f61fd4d541770f957383431a7'
            '7c52a25019d52e02254cc7b578d32aeea87c2fd5f708ef71dbeb6b7edd0aa08e'
            '288978a65fbd0524e9194940b9b15774b010cb7193ef5bf5a4a5df3358ef9df6'
            '96ddecb48e5734159f91261c3a4b7f71a757d6aab69d22f11df600fb91511b11'
            'ba93f62e249f2713dbfe6c82de1be4ac655264d6407ed3dc5e05323027520f31'
            'a2958d82986c81794e953a3762335fa7c78948706d23cced421f7245ca544cbc'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229')

prepare()
{
	cd gtk-$_gtkver

	QUILT_PATCHES=.. quilt push -av

	rm -f "$srcdir"/gtk-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css
	cat "$srcdir/smaller-adwaita.css" | tee -a "$srcdir"/gtk-"$_gtkver"/gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

build()
{
	CFLAGS+=" -DG_DISABLE_CAST_CHECKS"

	# 64-bit
	arch-meson gtk-$_gtkver build \
		-D broadway_backend=true \
		-D colord=auto \
		-D demos=false \
		-D examples=false \
		-D introspection=true \
		-D tests=false \
		-D installed_tests=false
	ninja -C build
}

package_gtk3-classic()
{
	DESTDIR="$pkgdir" meson install -C build

	install -Dm644 settings.ini -t "$pkgdir/usr/share/gtk-3.0"
	install -Dm644 gtk-query-immodules-3.0.hook -t "$pkgdir/usr/share/libalpm/hooks"

	rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
