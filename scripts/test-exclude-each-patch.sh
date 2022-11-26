#!/bin/bash
#
# For testing purposes, create multiple builds that exclude each patch
# on its own, to find out which patch is problematic.
#
# Designed for Arch Linux. Assumes build tools (makepkg) installed.
#
# This may take quite some time to build. To speed things up, delete the lib32*
# and 32-bit build from PKGBUILD before running this.
#

# Start in the root of the repository
cd "$(dirname "$0")/../"

PATCHES=$(ls *.patch)
OUTPUT_DIR="$(pwd)/builds/"

if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir "$OUTPUT_DIR"
fi

for patch in $PATCHES;
do
    if [ -f "$OUTPUT_DIR/$patch.tar.zst" ]
    then
        echo "Skipping $patch as build already exists."
        continue
    fi

    echo -e "\nBuilding without $patch ..."
    echo "================================================================"

    # Exclude in PKGBUILD
    sed -i "s/${patch}/\#${patch}/g" PKGBUILD
    sed -i "s/${patch}/\#${patch}/g" series

    # Build and move to output directory
    makepkg --clean --cleanbuild --skipint
    if [ $? == 0 ]; then
        if [ -f lib32*.tar.zst ]
        then
            rm *lib32-*.tar.zst
        fi
        mv *.tar.zst "$OUTPUT_DIR/$patch.tar.zst"
    else
        echo "Failed to build when patch not present: $patch"
    fi

    # Restore in PKGBUILD
    sed -i "s/\#${patch}/${patch}/g" PKGBUILD
    sed -i "s/\#${patch}/${patch}/g" series
done

echo -e "\n================================================================"
echo "Building complete. Now installing for testing..."
echo "Open the GTK3 window to test in another terminal."
echo -e "================================================================"

# Install each one
for patch in $PATCHES
do
    echo -e "\nInstalling without $patch..."
    sudo pacman --noconfirm -U "$OUTPUT_DIR/$patch.tar.zst"
    echo " "
    echo "Current excluded patch: $patch"
    read -p "Press ENTER to continue"
done
