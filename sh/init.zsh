# this file loads upon start of .zshrc

# OS and DISTRO variables, used to separate os and distro specific stuff throughout the config
OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
fi

# Enable Powerlevel10k instant prompt. Must stay at the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source all plugins
source ~/dotfiles/sh/plugins.zsh

# source all my terminal code
source ~/dotfiles/sh/functions.zsh
source ~/dotfiles/sh/updates.zsh
source ~/dotfiles/sh/aliases.zsh
source ~/dotfiles/sh/paths.zsh

# Powerlevel10k appearance
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zsh autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z}'

# Zsh colors
export CLICOLOR=1

# persistent terminal history
# HISTFILE=~/.zsh_history
# HISTSIZE=10000
# SAVEHIST=10000
# setopt APPEND_HISTORY
# setopt SHARE_HISTORY
