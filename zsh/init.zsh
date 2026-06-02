# This file loads upon start of .zshrc

# Enable Powerlevel10k instant prompt. Must stay at the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k appearance
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Variables used to separate stuff
OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
    WM=$XDG_SESSION_TYPE
fi

# Activate plugins
source ~/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

# Source the other files
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/updates.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/paths.zsh

# Terminal history (ctrl-r replaced by atuin)
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Colors
# https://geoff.greer.fm/lscolors/
export EZA_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:uu=33" # eza
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43" # linux, zsh completion
[[ $OS == Darwin ]] && export CLICOLOR=1 && export LSCOLORS=gxfxcxdxbxegedabagacad # macos

# Space expands !!
bindkey ' ' magic-space

# Zsh completion
zmodload zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z} r:|=* l:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:warnings' format '%F{red}no matches%f'
zstyle ':completion:*' verbose yes
_comp_options+=(globdots) # Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^?' backward-delete-char
