#!/bin/bash

# This script is used to apply Mushroom's patches to GTK source code.

# Current working directory should be set to main directory of GTK source code.
# Script should be placed beside patches files.

patch_makefiles()
{
	_replace_string_in_file()
	{
		sed -i".bak" "s/$1/$2/" "$3"
		rm "$3.bak"
	}

	_replace_string_in_file \
		"SRC_SUBDIRS = gdk gtk libgail-util modules demos tests testsuite examples" \
		"SRC_SUBDIRS = gdk gtk libgail-util modules demos" \
		"Makefile.am"

	_replace_string_in_file \
		"SUBDIRS = po po-properties \$(SRC_SUBDIRS) docs m4macros build" \
		"SUBDIRS = po \$(SRC_SUBDIRS) m4macros build" \
		"Makefile.am"

	_replace_string_in_file \
		"SUBDIRS = gtk-demo widget-factory icon-browser" \
		"SUBDIRS = widget-factory" \
		"demos/Makefile.am"

	_replace_string_in_file "SUBDIRS += cloudprint" "" "modules/printbackends/Makefile.am"
	_replace_string_in_file "SUBDIRS += cups" 	    "" "modules/printbackends/Makefile.am"
	_replace_string_in_file "gtk-update-icon-cache" "" "gtk/Makefile.am"
}

patch_gtk_code()
{
	patches_dir=$(dirname `realpath "$0"`)

	for patch_file in $patches_dir/*.patch; do
		patch -d "gtk" -p 3 -i "$patch_file"
	done

	cat "$patches_dir/smaller-adwaita.css" | tee -a gtk/theme/Adwaita/gtk-contained{,-dark}.css > /dev/null
}

# Make building faster by skipping tests, code examples and unused elements.
patch_makefiles

# Apply patches to GTK code.
patch_gtk_code