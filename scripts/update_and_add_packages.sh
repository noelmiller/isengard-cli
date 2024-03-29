#!/bin/bash

GREEN='\033[0;32m'

echo -e "${GREEN}### Updating and adding extra packages.. ###"

apk update
apk upgrade
grep -v '^#' /extra-packages | xargs apk add
