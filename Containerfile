FROM ghcr.io/ublue-os/bluefin-cli:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="noelmiller@protonmail.com"

COPY files /

RUN apk update && \
    apk upgrade && \
    grep -v '^#' /extra-packages | xargs apk add && \
    mv /etc/profile.d/00-bluefin-cli-brew-firstrun.sh /etc/profile.d/00-isengard-cli-brew-firstrun.sh && \
    sed -i 's/Bluefin/Isengard/g; s/bluefin/isengard/g' /etc/profile.d/00-isengard-cli-brew-firstrun.sh && \
    git clone https://github.com/VundleVim/Vundle.vim.git /isengard-vim/bundle/Vundle.vim && \
    vim -u /isengard-vim/vimrc +PluginInstall +qall && \
    git clone https://github.com/NvChad/NvChad ~/isengard-neovim/nvim --depth 1 && \
    ln -fs /usr/bin/distrobox-host-exec /usr/bin/ujust && \
    ln -fs /usr/bin/distrobox-host-exec /usr/bin/distrobox && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/firefox && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/code && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/kde-prompt

RUN rm /extra-packages
