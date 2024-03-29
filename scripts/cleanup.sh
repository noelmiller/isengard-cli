#!/bin/bash

echo "### Cleaning up.. ###"
# Sets permissions for the XDG directories
chmod -R o+rwx /XDG_DIRS/

# Removes files and directories that are no longer needed
rm -v /extra-packages
rm -vr /scripts

