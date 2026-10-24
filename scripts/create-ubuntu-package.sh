#!/bin/bash
#
# Creates a local package of gtk3-classic.
#
# This works by taking a copy of the original gtk+3.0 package and modifies
# it with our patches, then builds & installs locally.
#
# Thanks to N0rbert (from Ubuntu MATE team) for the original script to build for a PPA.
# Thanks to Robert (#137) for the improvements for local building.
#

# Version checks
. /etc/os-release
if [[ ! "$ID" == "ubuntu" ]]; then
    echo "This script only runs on Ubuntu."
    exit 1
fi

if [[ ! "$VERSION_ID" == "26.04" ]]; then
    echo "This script is designed to run on Ubuntu 26.04. It may not work for $VERSION_ID. Continue anyway? [y/N]"
    read answer
    if [[ ! "$answer" =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Work from the root of this repository
cd "$(dirname "$0")/../"

# If source was already unpacked/uploaded, clean folder
gtkdir=$(ls -d gtk+3.0*/ 2>/dev/null)
if [[ $? == 0 ]]; then
    echo "Deleting unpacked source..."
    rm -rv gtk+3.0*/ *.deb *.ddeb
    echo "Existing unpacked source deleted."
fi

# Ensure the necessary build tools and dependencies are installed
echo "Installing build dependencies..."
set -x
sudo apt-get install \
    adwaita-icon-theme \
    at-spi2-core \
    devscripts \
    dh-sequence-gir \
    dh-sequence-gnome \
    docbook-xsl \
    gir1.2-gdkpixbuf-2.0-dev \
    gir1.2-pango-1.0-dev \
    gobject-introspection \
    gsettings-desktop-schemas \
    gtk-doc-tools \
    libatk-bridge2.0-dev \
    libatk1.0-dev \
    libatk1.0-doc \
    libcairo2-dev \
    libcairo2-doc \
    libcloudproviders-dev \
    libcolord-dev \
    libcups2-dev \
    libegl1-mesa-dev \
    libepoxy-dev \
    libfontconfig-dev \
    libfreetype-dev \
    libfribidi-dev \
    libgdk-pixbuf-2.0-dev \
    libgirepository1.0-dev \
    libglib2.0-doc \
    libharfbuzz-dev \
    libjson-glib-dev:native \
    libpango1.0-dev \
    libpango1.0-doc \
    libwayland-dev \
    libxcomposite-dev \
    libxcursor-dev \
    libxdamage-dev \
    libxext-dev \
    libxfixes-dev \
    libxi-dev \
    libxinerama-dev \
    libxkbcommon-dev \
    libxkbfile-dev \
    libxml2-utils \
    libxrandr-dev \
    meson \
    ninja-build \
    sassc \
    ubuntu-dev-tools \
    wayland-protocols \
    xsltproc \
    xvfb

# Download source files
set -e
pull-lp-source gtk+3.0 $VERSION_CODENAME
GTKVERSION="$(ls -d gtk*/)"
GTKVERSION=${GTKVERSION/\//}
GTKVERSION=${GTKVERSION/gtk+3.0-/}
cd gtk+3.0-$GTKVERSION
quilt pop -a

# Copy our patches and make our series priority
cp -v ../*.patch debian/patches
mv debian/patches/series debian/patches/series.old
cp ../series debian/patches/series
cat debian/patches/series.old >> debian/patches/series
rm debian/patches/series.old

# Remove incompatible patches introduced by original package
function skip_patch() {
    sed -i "s/^$1/#$1/g" debian/patches/series
}

skip_patch "message-dialog-restore-traditional-look-on-unity.patch"
skip_patch "unity-border-radius.patch"

# Refresh each patch in sequence to avoid "fuzzy" diffs that would fail later
export QUILT_PATCHES="debian/patches"
for patch in $(quilt series | cat)
do
    quilt push
    quilt refresh
done
quilt pop -a
unset QUILT_PATCHES

# Prevent checks/tests from being run
grep "export DEB_BUILD_OPTIONS = nocheck" debian/rules || sed -i "s/^export VERBOSE=1/export VERBOSE=1\nexport DEB_BUILD_OPTIONS = nocheck/" debian/rules
echo -e "#!/bin/sh\nexit 0" > debian/run-tests.sh

# Remove symbols as dpkg-gensymbols detects they're different
rm debian/*.symbols

# Amend packaging metadata
sed -i '/^Uploaders:/d' debian/control

set +xe
DEBFULLNAME="$(whoami)"
DEBEMAIL="$(whoami)@$(hostname)"
LATEST_GIT_COMMIT=$(git log -n 1 --pretty=format:"%h")
dch -D $VERSION_CODENAME -v $GTKVERSION~classic~$VERSION_CODENAME "Add gtk3-classic patches ($LATEST_GIT_COMMIT)"

# Build package
dpkg-buildpackage -us -uc

echo " "
echo "Done! You can install all the classic GTK 3 packages using:"
echo "    sudo apt install ./*.deb"
echo " "
