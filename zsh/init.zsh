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

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then

# Colors
# https://geoff.greer.fm/lscolors/
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Persistent terminal history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY

fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# Colors
# https://geoff.greer.fm/lscolors/
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

fi
# =================================================================================
