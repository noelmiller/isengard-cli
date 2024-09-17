FROM ghcr.io/ublue-os/wolfi-toolbox:latest
ARG GH_TOKEN="${GH_TOKEN}"

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="A cloud-native terminal experience" \
  maintainer="noelmiller@protonmail.com"

COPY files /
COPY scripts /scripts

# Configure Locales and get bash-prexec
RUN /scripts/update_and_add_packages.sh \
    && curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o /tmp/bash-prexec \
    && mkdir -p /usr/share/ \
    && cp /tmp/bash-prexec /usr/share/bash-prexec \
    && printf 'LANG=en_US.utf8\nexport LANG\n' > /etc/profile.d/locale.sh \
    && printf 'LANG=en_US.utf8\nexport LANG\nSTARSHIP_CONFIG=/etc/starship.toml\nexport STARSHIP_CONFIG\neval "$(atuin init zsh)"\neval "$(zoxide init zsh --cmd cd)"\neval "$(starship init zsh)"' >> /etc/zsh/zshrc \
    && printf 'LANG="en_US.UTF-8"' > /etc/locale.conf \
    && rm -rf /tmp/* \
    && /scripts/create_xdg_dirs.sh \
    && /scripts/configure_github_copilot.sh \
    && /scripts/configure_tmux.sh \
    && /scripts/configure_distrobox.sh \
    && /scripts/cleanup.sh
