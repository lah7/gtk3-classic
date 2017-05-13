#!/bin/bash

# This script is used to create patch files.

# Current working directory should contain two subdirectories:
# * "org" — with oryginal GTK3 code,
# * "mod" — with modified GTK3 code.
# Patch file is saved under name specified by first argument.

if [[ -d ./org/gtk ]] && [[ -d ./mod/gtk ]] && [[ $1 ]]; then
	# Save.
	diff -U 5 -r -Z -B ./org/gtk ./mod/gtk > "$1.patch"
	# Preview.
	reset; diff --color=always -U 5 -r -Z -B ./org/gtk ./mod/gtk
fi
