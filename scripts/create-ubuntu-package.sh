#!/bin/bash
# *********************************
# Intended for maintainer use only!
# *********************************
# Creates a source package of gtk3-classic for packaging purposes.
#
# This works by taking a copy of the original gtk+3.0 package and modifies
# it with our patches. This is then submitted to Launchpad for building.
#
# Thanks to N0rbert (from Ubuntu MATE team) for the help!
#
PPA="lah7/gtk3-classic"

DISTRO=$(lsb_release -d | awk '{print $2}')
CODENAME=$(lsb_release -c | awk '{print $2}')

# Is this running on Ubuntu?
if [ ! "$DISTRO" == "Ubuntu" ]; then
    echo "Wrong distro! This script only works on Ubuntu."
    exit 1
fi

# Work from the root of this repository
cd "$(dirname "$0")/../"

# If source was already unpacked/uploaded, clean folder
gtkdir=$(ls -d gtk+3.0*/ 2>/dev/null)
if [ $? == 0 ]; then
    echo "Deleting unpacked source..."
    rm -rv gtk+3.0*/ *.changes *.build* *.upload
    echo "Existing unpacked source deleted."
fi

# Prompt for any alternates
read -p "Codename to package for: [$CODENAME] | " NEWCODENAME
if [ ! -z "$NEWCODENAME" ]; then
    CODENAME="$NEWCODENAME"
fi

read -p "PPA to build for: [$PPA] | " NEWPPA
if [ ! -z "$NEWPPA" ]; then
    PPA="$NEWPPA"
fi

set -x

# Ensure the necessary tools are installed
sudo apt-get install ubuntu-dev-tools devscripts

# Download source files
set -e
pull-lp-source gtk+3.0 $CODENAME
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
if [ ! "$CODENAME" == "focal" ]; then
    skip_patch "build-Don-t-export-GResource-related-symbols-with-newer-G.patch"
fi

# Refresh each patch in sequence to avoid "fuzzy" diffs that would fail later
export QUILT_PATCHES="debian/patches"
for patch in $(quilt series | cat)
do
    quilt push
    quilt refresh
done
quilt pop -a
unset QUILT_PATCHES

# Prevent checks from being run
grep "export DEB_BUILD_OPTIONS = nocheck" debian/rules || sed -i "s/^export VERBOSE=1/export VERBOSE=1\nexport DEB_BUILD_OPTIONS = nocheck/" debian/rules

# Create a new release
set +x
if [ -z "$DEBFULLNAME" ]; then
    echo "DEBFULLNAME enviroment variable missing."
    read -p "Enter name to sign package: " name
    export DEBFULLNAME="$name"
fi

if [ -z "$DEBEMAIL" ] && [ -z "$EMAIL" ]; then
    echo "DEBEMAIL or EMAIL enviroment variable missing."
    read -p "Enter e-mail address to sign package: " email
    export DEBEMAIL="$email"
fi

read -p "Enter revision number for package: " revision
set -x
dch -D $CODENAME -v $GTKVERSION-1ubuntu2ppa${revision}~classic "Rebuild"
nano debian/changelog

# Build source package
debuild -S -sd -nc

# Upload to Launchpad
dput ppa:$PPA ../*.changes
