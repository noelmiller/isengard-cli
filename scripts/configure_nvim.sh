#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh

echo "### Configuring nvim.. ###"

mv -v /isengard-nvim /XDG_DIRS/config/nvim
nvim --headless "+Lazy! sync" +qa
