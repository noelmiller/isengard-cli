#!/bin/bash

source /scripts/ansi_colors.sh
source /etc/profile.d/02-isengard-xdg.sh

echo -e "${GREEN}### Configuring TMUX.. ###"

mv -v /tmux /XDG_DIRS/config/tmux
git clone https://github.com/tmux-plugins/tpm /XDG_DIRS/config/tmux/plugins/tpm
/XDG_DIRS/config/tmux/plugins/tpm/bin/install_plugins
