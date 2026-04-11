#!/bin/bash
OS=$(uname)

# ssh
cp ~/.ssh/id_ed25519.pub ~/dotfiles/ssh/public_keys/$(hostname).pub # copies (doesn't sync) public keys
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

# shell
ln -sf ~/dotfiles/sh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/dotfiles/sh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf ~/dotfiles/sh/paths.zsh ~/.oh-my-zsh/custom/paths.zsh

# nvim
rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# ghostty
rm -rf ~/.config/ghostty
ln -s ~/dotfiles/ghostty ~/.config/ghostty

# powerlevel10k
ln -sf ~/dotfiles/powerlevel10k/p10k.zsh ~/.p10k.zsh

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then
    # aerospace
    ln -sf ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml
fi
