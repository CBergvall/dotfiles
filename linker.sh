#!/bin/bash

OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
fi

# Adds 'source ~/dotfiles/zsh/init.zsh' to the top of .zshrc if not already present.
ZSHRC="$HOME/.zshrc"
INIT_LINE="source ~/dotfiles/zsh/init.zsh"
if ! grep -qF "$INIT_LINE" "$ZSHRC"; then
    echo "$INIT_LINE" | cat - "$ZSHRC" >/tmp/zshrc_tmp && mv /tmp/zshrc_tmp "$ZSHRC"
    echo "Added init.zsh source line to .zshrc"
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
ln -sf ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh

# Global gitignore
git config --global core.excludesfile ~/dotfiles/git/gitignore

# yazi
rm -rf ~/.config/yazi
ln -s ~/dotfiles/yazi ~/.config/yazi

# atuin
mkdir -p ~/.config/atuinmkdir -p ~/.config/atuin
ln -sf ~/dotfiles/atuin/config.toml ~/.config/atuin/config.toml

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then

    # lazygit
    ln -sf ~/dotfiles/git/lazygit/config.yml ~/.config/lazygit/config.yml

fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

    # lazygit
    ln -sf ~/dotfiles/git/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

    # aerospace
    ln -sf ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml

fi
# =================================================================================
