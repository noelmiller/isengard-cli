#!/bin/bash

source /etc/profile.d/01-isengard-xdg.sh
mv /isengard-nvim /XDG_DIRS/config/nvim
nvim --headless "+Lazy! sync" +qa
