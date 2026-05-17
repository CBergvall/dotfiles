# Aliases and short functions

# Essentials
alias c='clear'
alias ls='ls -Gp'
alias l='ls -ahGp'
alias ll='ls -lahGp'
alias ff='fastfetch'
alias nv='nvim'
alias lg='lazygit'
alias tm='tmux new-session -A -s 0'

hg() {
  history 1 | grep "$1"
}

# wake on lan för debian-server och stationär dator
alias wake-server='wakeonlan 6c:4b:90:9f:59:f0'
alias wake-gaming='wakeonlan FC:34:97:9F:CA:33'

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

# Nix package manager alternate commands (this is a "temporary" solution since the default ones are nonsense)
alias nxi="nix profile install nixpkgs#"
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
