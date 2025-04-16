#!/usr/bin/python3
#
# Update the checksums in the PKGBUILD file without needing 'updpkgsums'
# from the pacman-contrib package in Arch Linux. Returns a non-zero
# exit code if the checksums need to be updated.
#
# This script is intended to be run in the CI pipeline.
#

import difflib
import re
import subprocess
import sys

with open("PKGBUILD", "r", encoding="utf-8") as f:
    original = f.read()

result = subprocess.run("makepkg -g", shell=True, capture_output=True, text=True, check=True)
new_sha256_block = result.stdout.strip("\n")

# Replace the old sha256sums block in PKGBUILD
old_sha256_block = re.search(r"sha256sums=\([^\)]*\)", original, re.DOTALL).group(0)
if not old_sha256_block:
    print("::error title=Missing sha256sums! There was a problem parsing the PKGBUILD file.")
    sys.exit(1)

if old_sha256_block == new_sha256_block:
    print("Checksums are up to date.")
    sys.exit(0)

# Replace and write back
new = original.replace(old_sha256_block, new_sha256_block)

# ::error file={name},line={line},endLine={endLine},title={title}::{message}
print("::error ::Checksums need to be updated.")
print("::warning ::If you use Arch Linux, please run 'updpkgsums' and commit the changes. Or use this diff and commit the changes.")

# Print diff for non Arch Linux users
diff = difflib.unified_diff(old_sha256_block.splitlines(), new_sha256_block.splitlines(), fromfile="old", tofile="new", lineterm="")
for line in diff:
    print(line)
sys.exit(1)
