#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh

echo "### Configure Github Copilot Extension.. ###"

echo "## Exporting Token.. ##"
export GH_TOKEN="${GH_TOKEN}"

echo "## Installing Extension.. ##"
gh extension install github/gh-copilot

echo "## Making config directory.. ##"
mkdir -vp /XDG_DIRS/config/gh-copilot

echo "## Creating config.yml.. ##"
echo "optional_analytics: false" > /XDG_DIRS/config/gh-copilot/config.yml

echo "## Creating Github Copilot Aliases.. ##"
gh copilot alias -- bash >> /etc/profile.d/03-isengard-functions.sh
