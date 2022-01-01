#!/bin/bash -xe
#
# Builds a local package of gtk3-classic for Ubuntu.
#
# This isn't standard compliant for source packages, but it'll work for a local
# binary build, working on top of the original gtk+3.0 packaging.
# As a result, this can't be uploaded to Launchpad or a PPA.
#

# Work from the root of this repository
cd "$(dirname "$0")/../"

# TODO: Add check it's running on Ubuntu

# TODO: Get source files
apt-get source gtk+3.0

# TODO: Check/prompt that source (deb-src) repositories are enabled in Software & Updates

# Install build dependencies
sudo apt-get build-dep gtk+3.0
sudo apt-get install build-essential quilt devscripts

# TODO: Copy our patches/files to debian/patches, and update 'series' file
cd gtk+3.0-3.24.30
cp -v ../*.patch debian/patches
cat ../series >> debian/patches/series

sed -i "s/^appearance__message-dialogs.patch/#appearance__message-dialogs.patch/g" debian/patches/series
sed -i "s/^csd__clean-headerbar.patch/#csd__clean-headerbar.patch/g" debian/patches/series
sed -i "s/^csd__disabled-by-default.patch/#csd__disabled-by-default.patch/g" debian/patches/series
sed -i "s/^file-chooser__places-sidebar.patch/#file-chooser__places-sidebar.patch/g" debian/patches/series

#quilt push -a

# Overwrite changelog
CODENAME=$(lsb_release -c | awk '{print $2}')
USERNAME=$(whoami)
EMAIL="$USERNAME@$(cat /etc/hostname)"
DATE=$(LC_ALL=C date +%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z)
echo """
gtk+3.0 (3.24.30-1ubuntu1-classic1) ${CODENAME}; urgency=low

  * gtk3-classic build

 -- ${USERNAME} <${EMAIL}>  ${DATE}
""" > debian/changelog

# TODO: Remove tests?
#rm -r debian/tests

# Create package!
export DEB_BUILD_OPTIONS=nocheck
#debuild -b
dpkg-buildpackage -rfakeroot -b -uc

# Install patched packages
sudo apt install ../*.deb
