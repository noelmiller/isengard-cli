FROM ghcr.io/ublue-os/bluefin-cli:latest
ARG GH_TOKEN="${GH_TOKEN}"

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
  mkdir -p /XDG_DIRS && \
  mkdir -p /XDG_DIRS/config && \
  mkdir -p /XDG_DIRS/local/share && \
  mkdir -p /XDG_DIRS/local/state && \
  mkdir -p /XDG_DIRS/cache && \
  mv /tmux /XDG_DIRS/config/tmux && \
  source /etc/profile.d/01-isengard-xdg.sh && \
  export GH_TOKEN="${GH_TOKEN}" && \
  gh extension install github/gh-copilot && \
  gh copilot alias -- bash >> /etc/profile.d/03-isengard-functions.sh && \
  git clone https://github.com/tmux-plugins/tpm /XDG_DIRS/config/tmux/plugins/tpm && \
  /XDG_DIRS/config/tmux/plugins/tpm/bin/install_plugins && \
  mv /isengard-nvim /XDG_DIRS/config/nvim && \
  nvim --headless "+Lazy! sync" +qa && \
  chmod -R o+rwx /XDG_DIRS/ && \
  ln -fs /usr/bin/distrobox-host-exec /usr/bin/ujust && \
  ln -fs /usr/bin/distrobox-host-exec /usr/bin/distrobox && \
  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/code && \
  ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/kde-prompt

RUN rm /extra-packages
