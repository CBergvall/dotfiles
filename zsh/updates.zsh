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

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then
  update_options=(dotfiles update_dotfiles atuin update_atuin backup update_backup homebrew update_homebrew nix update_nix)
  update_routine=(dotfiles atuin backup homebrew)
  update_routine_label='dotfiles, Atuin, backup, Homebrew'

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  update_atuin() {
    mark 'Atuin' && atuin sync
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
fi

# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then
  update_options=(dotfiles update_dotfiles atuin update_atuin restic status_restic apt update_apt nix update_nix docker update_docker)
  update_routine=(dotfiles atuin apt)
  update_routine_label='dotfiles, Atuin, Apt'

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  update_atuin() {
    mark 'Atuin' && atuin sync
  }
  status_restic() {
    mark 'Restic status'
    echo "--- Last snapshot ---\n"
    sudo restic -r /home/carlbergvall/usb2/restic-repo --password-file /etc/restic/password snapshots --latest 1
    echo "\n\n--- Timer-status ---\n"
    systemctl list-timers backup-sdb.timer --no-pager
    echo "\n\n--- Result of last run ---\n"
    systemctl status backup-sdb.service --no-pager | grep -E "Active|Process"
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
fi

# ===================================== Arch ======================================
if [[ $DISTRO == arch || $DISTRO == cachyos ]]; then
  update_options=(dotfiles update_dotfiles atuin update_atuin paru update_paru nix update_nix)
  update_routine=(dotfiles atuin paru)
  update_routine_label='dotfiles, Atuin, Paru'

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  update_atuin() {
    mark 'Atuin' && atuin sync
  }
  update_paru() {
    mark 'Paru (Pacman)' && paru -Syu
  }
  update_nix() {
    mark 'Nix' && nix registry pin nixpkgs && nix profile upgrade --all
  }
fi

