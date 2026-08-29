# Aliases and short, one-line functions

# Essentials
alias c='clear'
alias ff='fastfetch'
nv() { nvim "${1:-.}" }
alias lg='lazygit'
tm() { tmux new-session -A -s "${1:-0}" }
alias src='source ~/.zshrc'
alias e='exit'

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
alias llav='eza -lahF --icons --group-directories-last --no-quotes --git --ignore-glob=".git"' && alias llva='llav'

# git
alias gcl='git clone'
alias gi='git init'
alias grao='git remote add origin' #[url]
alias gpom='git push -u origin main'

alias gst='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend --no-edit'
alias gcam='git commit --amend -m'
alias gp='git push'
alias gpl='git pull'

alias grh='git reset --hard HEAD && git clean -fdx' # resets to the last local commit
alias gro='git fetch origin && git reset --hard origin/main && git clean -fdx' # resets to the last remote commit

alias gb='git branch'
alias gs='git switch'
gsm() { git switch main 2>/dev/null || git switch master; }
alias gsc='git switch -c'
alias gm='git merge'
gmm() { git merge main 2>/dev/null || git merge master; }
alias gr='git rebase'
grm() { git rebase main 2>/dev/null || git rebase master; }

# clipboard
[[ $OS == Darwin  ]] && alias cb='pbcopy'
[[ $WM == x11     ]] && alias cb='xclip -selection clipboard'
[[ $WM == wayland ]] && alias cb='wl-copy'

# wake on lan för debian-server och stationär dator
alias wake-server='wakeonlan 6c:4b:90:9f:59:f0'
alias wake-desktop='wakeonlan FC:34:97:9F:CA:33'

# Nix package manager alternate commands (this is a "temporary" solution since the default ones are nonsense)
nxi() { nix profile add nixpkgs#"${1}" }
alias nxr="nix profile remove"
alias nxs="nh search"
alias nxl="nix profile list"
alias nxug="nix profile upgrade --all"
alias nxud="nix registry pin nixpkgs"
alias nxuu="update -n"

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then



fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# backups (rsync från min laptop till min server)

alias backup-dev='rsync -avzh --delete ~/Dev/ server:/mnt/raid/backups/dev/'
alias backup-misc='rsync -avzh --delete ~/Misc/backup/ server:/mnt/raid/backups/misc/'
alias backup-all="mark 'backup-dev' && backup-dev && mark 'backup-misc' && backup-misc"

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

alias ld="lazydocker"

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
