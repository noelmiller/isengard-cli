FROM ghcr.io/ublue-os/bluefin-cli:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="noelmiller@protonmail.com"

COPY files /

RUN apk update && \
    apk upgrade && \
    grep -v '^#' /extra-packages | xargs apk add && \
    git clone https://github.com/VundleVim/Vundle.vim.git /isengard-vim/bundle/Vundle.vim && \
    vim -u /isengard-vim/vimrc +PluginInstall +qall && \
    ln -fs /usr/bin/distrobox-host-exec /usr/bin/ujust

RUN rm /extra-packages
