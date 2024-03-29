#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh
export GH_TOKEN="${GH_TOKEN}"
gh extension install github/gh-copilot
mkdir -p /XDG_DIRS/config/gh-copilot
echo "optional_analytics: false" > /XDG_DIRS/config/gh-copilot/config.yml
gh copilot alias -- bash >> /etc/profile.d/03-isengard-functions.sh
