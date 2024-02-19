alias butane='podman run --rm --interactive         \
              --security-opt label=disable          \
              --volume "${PWD}":/pwd --workdir /pwd \
              quay.io/coreos/butane:release'

# ===============================
# Ansible aliases (ansible-navigator)
# ===============================

alias anr="ansible-navigator run"
alias ansc="ansible-navigator run --syntax-check"
alias anc="ansible-navigator run --check"
alias acd="ansible-navigator config dump"
alias av="ansible --version"
alias aig="ansible-navigator inventory --graph"

# ===============================
# Terminal Aliases
# ===============================
alias hterm="kde-prompt --tab-with-profile=Host"

# ================
# General aliases
# ================

# stop using scp
alias scp="echo -e \nStop using scp\n\nSee https://www.redhat.com/en/blog/openssh-scp-deprecation-rhel-9-what-you-need-know"

# decomment a config file
alias decomment='grep -v -E "^[[:space:]]*((#|;|//).*)?$" '

# check justfile
alias check-just="just --unstable --fmt --check -f"

# lazygit
alias lg="lazygit"
