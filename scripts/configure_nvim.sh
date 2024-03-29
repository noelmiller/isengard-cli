#!/bin/bash

echo "### Configuring nvim.. ###"
source /etc/profile.d/01-isengard-xdg.sh
mv -v /isengard-nvim /XDG_DIRS/config/nvim
nvim --headless "+Lazy! sync" +qa
