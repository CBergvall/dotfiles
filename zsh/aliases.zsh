# Aliases and short, one-line functions

# Essentials
alias c='clear'
alias ff='fastfetch'
alias nv='nvim'
alias lg='lazygit'
tm() { tmux new-session -A -s "${1:-0}" }
hg() { history 1 | grep "$1" }
alias src='source ~/.zshrc'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# ls (eza)
alias l='   eza -F    --icons --group-directories-last --no-quotes'
alias la='  eza -aF   --icons --group-directories-last --no-quotes --ignore-glob=".git"'
alias ll='  eza -lF   --icons --group-directories-last --no-quotes --git --no-filesize --no-permissions --no-user --no-time'
alias lla=' eza -laF  --icons --group-directories-last --no-quotes --git --ignore-glob=".git" --no-filesize --no-permissions --no-user --no-time'
alias llv=' eza -lhF  --icons --group-directories-last --no-quotes --git'
alias llav='eza -lahF --icons --group-directories-last --no-quotes --git --ignore-glob=".git"'
alias llva='llav'
alias lt='  eza -F    --icons --group-directories-last --no-quotes --tree --level=2'
alias lta=' eza -aF   --icons --group-directories-last --no-quotes --tree --level=2 --ignore-glob=".git"'

# wake on lan för debian-server och stationär dator
alias wake-server='wakeonlan 6c:4b:90:9f:59:f0'
alias wake-desktop='wakeonlan FC:34:97:9F:CA:33'

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then



fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# backups (rsync från min laptop till min server)
alias backup-dev='rsync -avzh --delete ~/Dev/ server:/home/carlbergvall/backups/dev/'
alias backup-misc='rsync -avzh --delete ~/Misc/backup/ server:/home/carlbergvall/backups/misc/'
alias backup-all="mark 'backup-dev' && backup-dev && mark 'backup-misc' && backup-misc"

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

alias bat='batcat' # bat is batcat in apt

# Nix package manager alternate commands (this is a "temporary" solution since the default ones are nonsense)
nxi() { nix profile add nixpkgs#"${1}" }
alias nxr="nix profile remove"
alias nxs="nix search nixpkgs"
alias nxl="nix profile list"
alias nxug="nix profile upgrade --all"
alias nxud="nix registry pin nixpkgs"
alias nxuu="update -n"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
