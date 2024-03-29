FROM ghcr.io/ublue-os/bluefin-cli:latest
ARG GH_TOKEN="${GH_TOKEN}"

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="A cloud-native terminal experience" \
  maintainer="noelmiller@protonmail.com"

COPY files /
COPY scripts /scripts

RUN /scripts/update_and_add_packages.sh && \
    /scripts/configure_brew.sh && \
    /scripts/create_xdg_dirs.sh && \
    /scripts/configure_github_copilot.sh && \
    /scripts/configure_tmux.sh && \
    /scripts/configure_nvim.sh && \
    /scripts/configure_distrobox.sh && \
    /scripts/cleanup.sh
