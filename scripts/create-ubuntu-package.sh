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
sudo apt-get source gtk+3.0

# TODO: Check/prompt that source (deb-src) repositories are enabled in Software & Updates

# Install build dependencies
sudo apt-get build-dep gtk+3.0
sudo apt-get install build-essential quilt devscripts

# TODO: Copy our patches/files to debian/patches, and update 'series' file

# Apply patches before build
ln -s debian/patches .
quilt push -a

# Overwrite changelog
CODENAME=$(lsb_release -c | awk '{print $2}')
USERNAME=$(whoami)
EMAIL="$USERNAME@$(cat /etc/hostname)"
DATE=$(date +%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z)
echo """
gtk+3.0 (3.24.30-classic1) ${CODENAME}; urgency=low

  * gtk3-classic build

 -- ${USERNAME} <${USERNAME}@${EMAIL}>  ${DATE}
""" > debian/changelog

# TODO: Remove tests?
#rm -r debian/tests

# Create package!
export DEB_BUILD_OPTIONS=nocheck
#debuild -b
dpkg-buildpackage -rfakeroot -b  #-uc

# Install patched packages
sudo apt install ../*.deb
