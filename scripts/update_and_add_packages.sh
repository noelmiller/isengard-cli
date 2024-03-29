#!/bin/bash

echo "### Updating and adding extra packages.. ###"
apk update
apk upgrade
grep -v '^#' /extra-packages | xargs apk add
