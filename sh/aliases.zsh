OS=$(uname)

# enkla grejor
alias c='clear'

alias ff='fastfetch'

alias nv='nvim'

alias lg='lazygit'

alias tm='tmux new-session -A -s 0'

# Nix package manager (the real commands are so ass-backward that I had to fix them)
alias nxi="nix profile install nixpkgs#"
alias nxr="nix profile remove"
alias nxs="nix search nixpkgs"
alias nxl="nix profile list"
alias nxug="nix profile upgrade --all"
alias nxud="nix registry pin nixpkgs"
alias nxuu="nix registry pin nixpkgs && nix profile upgrade --all"

# c++ kompilerings-saker
alias w++17='g++ -std=c++17 -Wall -Wextra -pedantic -g'
alias e++17='g++ -std=c++17 -Wall -Wextra -pedantic -Werror -g'

# wake on lan för debian-server och stationär dator
alias wake_server='wakeonlan 6c:4b:90:9f:59:f0'
alias wake_gaming='wakeonlan FC:34:97:9F:CA:33'

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then

    # ------------------------- backup commands -------------------------
    # -a — archive mode (preserves permissions, timestamps, etc.)
    # -z — compress during transfer
    # -vh - verbose, human readable
    # --delete — removes files on the server that are deleted locally
    alias backup-dev='rsync -avzh --delete ~/Dev/ server:/home/carlbergvall/backups/dev/'

    alias backup-misc='rsync -avzh --delete ~/Misc/backup/ server:/home/carlbergvall/backups/misc/'

    alias backup-all='backup-dev; backup-misc'
    
    # Kommer ärligt talat inte inhåg exakt hur dessa funkar ¯\_(ツ)_/¯
    # alias rosetta2_mode='arch -x86_64 /bin/zsh -c "export PATH=/usr/local/bin:/usr/local/sbin:$PATH; eval \$(/usr/local/bin/brew shellenv); exec /bin/zsh"'
    # alias rosetta2_exit='exit; export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH; eval "$(/opt/homebrew/bin/brew shellenv)"'
fi

# Linux-specifikt
# =================================================================================
if [[ $OS == Linux ]]; then
    alias gui='sudo systemctl isolate graphical.target'
    alias cli='sudo systemctl isolate multi-user.target'

    alias show_mounts='lsblk -o NAME,SIZE,MODEL,MOUNTPOINT'

fi
