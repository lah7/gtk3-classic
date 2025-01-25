#!/bin/bash
#
# Refresh patches to remove fuzz/offset.
# This is necessary for Debian's dpkg-source.
#
# https://wiki.debian.org/Projects/DebSrc3.0
#

# Obtain GTK sources
source PKGBUILD
if [[ ! -f "gtk-${_gtkver}.tar.gz" ]]; then
    wget "https://gitlab.gnome.org/GNOME/gtk/-/archive/${_gtkver}/gtk-${_gtkver}.tar.gz"
    tar -xzf "gtk-${_gtkver}.tar.gz"
fi
cd gtk-*/
export QUILT_PATCHES=../

# Refresh each patch file
set -x
quilt pop -a

while quilt push
do
    quilt refresh -p ab
done
