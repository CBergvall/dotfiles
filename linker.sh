OS=$(uname)

# shell
ln -sf ~/dotfiles/shell/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/dotfiles/shell/functions.zsh ~/.oh-my-zsh/custom/functions.zsh
ln -sf ~/dotfiles/shell/paths.zsh ~/.oh-my-zsh/custom/paths.zsh

# aerospace
if [[ $OS == Darwin ]]; then
    ln -sf ~/dotfiles/aerospace/aerospace.toml ~/.aerospace.toml
fi

# ghostty
if [[ $OS == Darwin ]]; then
    ln -s ~/dotfiles/ghostty ~/.config/ghostty
fi

# nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# ssh
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
