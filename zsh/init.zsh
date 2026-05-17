# this file loads upon start of .zshrc

# Enable Powerlevel10k instant prompt. Must stay at the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k appearance
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OS and DISTRO variables, used to separate os and distro specific stuff throughout the config
OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
fi

# source all plugins
source ~/dotfiles/zsh/plugins.zsh

# source all my terminal code
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/updates.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/paths.zsh

# Zsh autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z}'

# persistent terminal history
# HISTFILE=~/.zsh_history
# HISTSIZE=10000
# SAVEHIST=10000
# setopt APPEND_HISTORY
# setopt SHARE_HISTORY

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then

export LS_COLORS="di=36:ln=00:so=01;34:pi=00:ex=37:bd=00:cd=01;33:su=35:sg=00:tw=37:ow=36"

fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

fi
# =================================================================================
