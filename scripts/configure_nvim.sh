#!/bin/bash

source /scripts/ansi_colors.sh
source /etc/profile.d/01-isengard-xdg.sh

echo -e "${GREEN}### Configuring nvim.. ###"

mv -v /isengard-nvim /XDG_DIRS/config/nvim
nvim --headless "+Lazy! sync" +qa
