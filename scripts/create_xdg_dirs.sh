#!/bin/bash

source /scripts/ansi_colors.sh

echo -e "${GREEN}### Creating XDG_DIRS.. ###"

mkdir -vp /XDG_DIRS
mkdir -vp /XDG_DIRS/config
mkdir -vp /XDG_DIRS/local/share
mkdir -vp /XDG_DIRS/local/state
mkdir -vp /XDG_DIRS/cache
