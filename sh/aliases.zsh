OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
fi

# Essentials
alias c='clear'
alias ff='fastfetch'
alias nv='nvim'
alias lg='lazygit'
alias tm='tmux new-session -A -s 0'

# c++ kompilerings-saker
alias w++17='g++ -std=c++17 -Wall -Wextra -pedantic -g'
alias e++17='g++ -std=c++17 -Wall -Wextra -pedantic -Werror -g'

# wake on lan för debian-server och stationär dator
alias wake_server='wakeonlan 6c:4b:90:9f:59:f0'
alias wake_gaming='wakeonlan FC:34:97:9F:CA:33'

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# backups (rsync från min laptop till min server)
alias backup-dev='rsync -avzh --delete ~/Dev/ server:/home/carlbergvall/backups/dev/'
alias backup-misc='rsync -avzh --delete ~/Misc/backup/ server:/home/carlbergvall/backups/misc/'
alias backup-all='backup-dev; backup-misc'

# Updates commands
alias buu="brew update && brew upgrade && brew cleanup" # Brew
alias muu="mas upgrade" # Mas (Mac App Store CLI)
alias suu="sudo softwareupdate -iaR" # MacOS system update
alias uu="buu && muu && softwareupdate -l"

fi
# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then


fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

# Update commands
alias auu="sudo apt update && sudo apt upgrade && sudo apt autoremove" # Apt
alias nuu="nix registry pin nixpkgs && nix profile upgrade --all && nix store gc" # Nix
alias duu="(cd /opt/docker && docker compose pull && docker compose down && docker compose up -d && docker image prune -f)" # Docker (specifikt på min server)
alias uu="auu && nuu && (cd /opt/docker && docker compose images)"

# Nix package manager alternate commands (the default ones are nonsense)
alias nxi="nix profile install nixpkgs#"
alias nxr="nix profile remove"
alias nxs="nix search nixpkgs"
alias nxl="nix profile list"
alias nxug="nix profile upgrade --all"
alias nxud="nix registry pin nixpkgs"
alias nxuu="nuu"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then

# Update commands
alias uu="paru -Syu"

fi
# =================================================================================
