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
    WM=$XDG_SESSION_TYPE
fi

# source all plugins
source ~/dotfiles/zsh/plugins.zsh

# source the rest
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/updates.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/paths.zsh

# Terminal history (replaced by atuin but worth keeping around for autosuggestions)
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

# Colors
# https://geoff.greer.fm/lscolors/
export EZA_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:uu=33" # eza
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43" # linux, zsh completion
[[ $OS == Darwin ]] && export CLICOLOR=1 && export LSCOLORS=gxfxcxdxbxegedabagacad # macos

# space expands !! for instance 
bindkey ' ' magic-space

# Zsh completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z} r:|=* l:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}no matches%f'
zstyle ':completion:*' verbose yes
