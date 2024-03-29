#!/bin/bash

source /scripts/ansi_colors.sh

echo -e "${GREEN}### Updating and adding extra packages.. ###"

apk update
apk upgrade
grep -v '^#' /extra-packages | xargs apk add
