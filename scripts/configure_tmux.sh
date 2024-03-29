#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh
mv /tmux /XDG_DIRS/config/tmux
git clone https://github.com/tmux-plugins/tpm /XDG_DIRS/config/tmux/plugins/tpm
/XDG_DIRS/config/tmux/plugins/tpm/bin/install_plugins
