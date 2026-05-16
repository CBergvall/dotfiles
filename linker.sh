#!/bin/bash

OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
fi

# ssh
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

# nvim
rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# ghostty
rm -rf ~/.config/ghostty
ln -s ~/dotfiles/ghostty ~/.config/ghostty

# powerlevel10k
ln -sf ~/dotfiles/powerlevel10k/p10k.zsh ~/.p10k.zsh

# Global gitignore
git config --global core.excludesfile ~/dotfiles/git/gitignore

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

    # aerospace
    ln -sf ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml

fi
# =================================================================================
