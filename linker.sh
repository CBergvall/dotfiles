#!/bin/bash
OS=$(uname)

# ssh
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

# shell
ln -sf ~/dotfiles/sh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/dotfiles/sh/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf ~/dotfiles/sh/paths.zsh ~/.oh-my-zsh/custom/paths.zsh

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

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then
    # aerospace
    ln -sf ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml
fi

# Global gitignore
git config --global core.excludesfile ~/dotfiles/git/gitignore
