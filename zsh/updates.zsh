# ===================================== Update function =====================================
update() {
  local selected key label action i keys=''

  case "$1" in
    -A)
      selected=$update_all
      ;;
    -*)
      selected=${1#-}
      ;;
    *)
      for (( i = 1; i <= $#update_options; i += 3 )); do
        keys+=$update_options[i]
      done
      echo "Usage: update -A | -[${keys}]"
      echo "  -A  ${update_all_label}"
      for (( i = 1; i <= $#update_options; i += 3 )); do
        key=$update_options[i]
        label=${update_options[i+2]}
        echo "  -${key}  ${label}"
      done
      return 1
      ;;
  esac

  for (( i = 1; i <= $#update_options; i += 3 )); do
    key=$update_options[i]
    action=${update_options[i+1]}
    [[ $selected == *$key* ]] || continue
    $action || return $?
  done
}

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then
  update_options=(d update_dotfiles dotfiles b update_backup backup h update_homebrew Homebrew n update_nix Nix t update_atuin atuin)

  update_all='dbht'
  update_all_label='dotfiles, backup, Homebrew'

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
    update_atuin() {
        mark 'atuin' && atuin sync
    }
fi

# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then
  update_options=(d update_dotfiles dotfiles r update_restic 'Restic status' a update_apt 'Nala (Apt)' n update_nix Nix D update_docker Docker)
  update_all='da'

  update_all_label='dotfiles, Nala'

  restic-status() {
    echo "--- Last snapshot ---\n"
    sudo restic -r /home/carlbergvall/usb2/restic-repo --password-file /etc/restic/password snapshots --latest 1
    echo "\n\n--- Timer-status ---\n"
    systemctl list-timers backup-sdb.timer --no-pager
    echo "\n\n--- Result of last run ---\n"
    systemctl status backup-sdb.service --no-pager | grep -E "Active|Process"
  }

  update_dotfiles() {
    mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  }
  update_restic() {
    mark 'Restic Backup Status' && restic-status
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
  update_options=(d update_dotfiles dotfiles p update_paru 'Paru (Pacman)' n update_nix Nix)
  update_all='dp'
  update_all_label='dotfiles, Paru'

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

