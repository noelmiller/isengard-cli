#!/bin/bash

# Fixes brew intallation scripts and path from Bluefin CLI. This will be deprecated in the future.

echo "### Configuring Brew.. ###"

mv -v /etc/profile.d/00-bluefin-cli-brew-firstrun.sh /etc/profile.d/00-isengard-cli-brew-firstrun.sh
sed -i 's/Bluefin/Isengard/g; s/bluefin/isengard/g' /etc/profile.d/00-isengard-cli-brew-firstrun.sh
