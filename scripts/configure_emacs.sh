#!/bin/bash

source /scripts/ansi_colors.sh
source /etc/profile.d/01-isengard-xdg.sh

echo -e "${GREEN}### Configuring emacs.. ###"

git clone --depth 1 https://github.com/doomemacs/doomemacs /XDG_DIRS/config/emacs
/XDG_DIRS/config/emacs/bin/doom --yes install
#mv -v /isengard-nvim /XDG_DIRS/config/nvim
