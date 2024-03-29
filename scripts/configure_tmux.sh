#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh
git clone https://github.com/tmux-plugins/tpm /XDG_DIRS/config/tmux/plugins/tpm
mv /tmux /XDG_DIRS/config/tmux
/XDG_DIRS/config/tmux/plugins/tpm/bin/install_plugins
