#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh

echo "### Configuring TMUX.. ###"

mv -v /tmux /XDG_DIRS/config/tmux
git clone https://github.com/tmux-plugins/tpm /XDG_DIRS/config/tmux/plugins/tpm
/XDG_DIRS/config/tmux/plugins/tpm/bin/install_plugins
