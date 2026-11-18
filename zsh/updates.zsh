# ===================================== Update function =====================================
update() {
  local requested=$1 name action i found=0

  if (( $# != 1 )); then
    echo "Usage: update <routine|name>"
    echo "  routine:  ${update_routine_label}"
    for (( i = 1; i <= ${#update_options}; i += 2 )); do
      echo "  ${update_options[i]}"
    done
    (( $# == 0 )) && return 0
    return 1
  fi

  for (( i = 1; i <= ${#update_options}; i += 2 )); do
    name=${update_options[i]}
    action=${update_options[i+1]}
    if [[ $requested == $name || ( $requested == routine && " ${update_routine[*]} " == *" $name "* ) ]]; then
      found=1
      $action || return $?
      [[ $requested == routine ]] || return 0
    fi
  done

  if (( ! found )); then
    echo "Unknown update '$requested'. Run 'update' to see available options."
    return 1
  fi
}

# ===================================== laptop =====================================
if [[ $NAME == laptop ]]; then
  update_options=(dotfiles update_dotfiles backup update_backup homebrew update_homebrew nix update_nix)
  update_routine=(dotfiles backup homebrew)
  update_routine_label='dotfiles, backup, Homebrew'

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  update_backup() {
    mark 'backup' && rsync -ah --delete --info=progress2,stats2 --no-inc-recursive ~/backup/ server:/mnt/usb/backup/laptop/
  }
  update_homebrew() {
    mark 'Homebrew' && brew update && brew upgrade && brew cleanup
  }
  update_nix() {
    mark 'Nix' && nix registry pin nixpkgs && nix profile upgrade --all
  }

# ==================================== server =====================================
elif [[ $NAME == server ]]; then
  update_options=(dotfiles update_dotfiles restic status_restic apt update_apt nix update_nix docker update_docker)
  update_routine=(dotfiles apt)
  update_routine_label='dotfiles, Apt'

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  status_restic() {
    mark 'Restic status'
    local result ts secs
    result=$(systemctl show backup-sdb.service -p Result --value)
    ts=$(systemctl show backup-sdb.service -p ExecMainExitTimestamp --value)
    secs=$(( $(date +%s) - $(date -d "$ts" +%s) ))
    echo "Last run:  $result, $((secs / 3600))h $((secs % 3600 / 60))m ago"
    echo "Next run:  $(systemctl show backup-sdb.timer -p NextElapseUSecRealtime --value)"
    echo
    df -h /home/carlbergvall/usb2
  }
  update_apt() {
    mark 'Nala (Apt)' && sudo nala update && sudo nala upgrade && sudo nala autoremove
  }
  update_nix() {
    mark 'Nix' && nix registry pin nixpkgs && nix profile upgrade --all
  }
  update_docker() {
    mark 'Docker' && (cd /opt/docker && docker compose pull && docker compose down && docker compose up -d && docker image prune -f)
  }

# ===================================== desktop, disk ======================================
elif [[ $NAME == desktop || $NAME == disk ]]; then
  update_options=(dotfiles update_dotfiles paru update_paru nix update_nix)
  update_routine=(dotfiles paru)
  update_routine_label='dotfiles, Paru'

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  update_paru() {
    mark 'Paru (Pacman)' && paru -Syu
  }
  update_nix() {
    mark 'Nix' && nix registry pin nixpkgs && nix profile upgrade --all
  }
fi

