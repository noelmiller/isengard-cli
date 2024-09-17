# shellcheck shell=sh disable=SC1091
if test "$(id -u)" -gt "0"; then
  blue=$(printf '\033[38;5;32m')
  bold=$(printf '\033[1m')
  normal=$(printf '\033[0m')

  if test ! -d /usr/local/share/bash-completion/completions; then
    printf "Setting up Tab-Completions...\t\t\t "
    sudo mkdir -p /usr/local/share/bash-completion
    sudo mount --bind /run/host/usr/share/bash-completion /usr/local/share/bash-completion
    if test -x /run/host/usr/bin/ujust; then
      sudo ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/ujust
    fi
    printf "%s[ OK ]%s\n" "${blue}" "${normal}"
  fi
fi