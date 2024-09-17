#!/bin/bash

source /scripts/ansi_colors.sh
source /etc/profile.d/02-isengard-xdg.sh

echo -e "${GREEN}### Configure Github Copilot Extension.. ###"

echo -e "${YELLOW}## Exporting Token.. ##"
export GH_TOKEN="${GH_TOKEN}"

echo -e "${YELLOW}## Installing Extension.. ##"
gh extension install github/gh-copilot

echo -e "${YELLOW}## Making config directory.. ##"
mkdir -vp /XDG_DIRS/config/gh-copilot

echo -e "${YELLOW}## Creating config.yml.. ##"
echo "optional_analytics: false" > /XDG_DIRS/config/gh-copilot/config.yml

echo -e "${YELLOW}## Creating Github Copilot Aliases.. ##"
gh copilot alias -- bash >> /etc/profile.d/03-isengard-functions.sh
