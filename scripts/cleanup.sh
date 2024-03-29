#!/bin/bash

# Sets permissions for the XDG directories
chmod -R o+rwx /XDG_DIRS/

# Removes files and directories that are no longer needed
rm /extra-packages
rm -r /scripts

