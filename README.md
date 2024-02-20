# Isengard-CLI

## Description

This terminal is based off of [bluefin-cli](https://github.com/ublue-os/toolboxes/tree/main/toolboxes/bluefin-cli) from the [Universal Blue](https://universal-blue.org/) project.

### Changes to Bluefin-CLI

- lazy neovim config included in image
- Bash Aliases that I find useful
- Additional [packages](https://github.com/noelmiller/isengard-cli/blob/main/files/extra-packages) that are not in the base image

## How to use

### Create Box

Using [Distrobox](https://github.com/89luca89/distrobox):

    distrobox create -i ghcr.io/noelmiller/isengard-cli -n isengard-cli --volume isengard-cli-gh:/XDG_DIRS/config/gh:rslave --volume isengard-cli-github-copilot:/XDG_DIRS/config/github-copilot:rslave --volume isengard-cli-zoxide:/XDG_DIRS/local/share/zoxide:rslave --volume isengard-cli-atuin:/XDG_DIRS/local/share/atuin:rslave --volume isengard-cli-lazygit:/XDG_DIRS/config/lazygit:rslave
    distrobox enter isengard-cli
    

### Make your own

Fork and add programs to this this image - over time you'll end up with the perfect CLI for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/noelmiller/isengard-cli
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
