# Update functions

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

update() {
  local do_dotfiles=0 do_backup=0 do_homebrew=0 do_nix=0

  case "$1" in
    -A) do_dotfiles=1; do_backup=1; do_homebrew=1; do_nix=1 ;;
    -*)
      [[ "$1" == *d* ]] && do_dotfiles=1
      [[ "$1" == *b* ]] && do_backup=1
      [[ "$1" == *h* ]] && do_homebrew=1
      [[ "$1" == *n* ]] && do_nix=1
      ;;
    *)
      echo "Usage: update -A | -[d][b][h][n]"
      echo "  -A  All of the below"
      echo "  -d  dotfiles"
      echo "  -b  backup"
      echo "  -h  Homebrew"
      echo "  -n  Nix"
      return 1
      ;;
  esac

  (( do_dotfiles )) && mark 'dotfiles' && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  (( do_backup   )) && mark 'backup'   && rsync -ah --delete --info=progress2,stats2 --no-inc-recursive ~/backup/ server:/mnt/usb/backup/laptop/
  (( do_homebrew )) && mark 'Homebrew' && brew update && brew upgrade && brew cleanup
  (( do_nix      )) && mark 'Nix'      && nix registry pin nixpkgs && nix profile upgrade --all
}

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

update() {
  local do_dotfiles=0 do_apt=0 do_nix=0 do_docker=0

  case "$1" in
    -A) do_dotfiles=1; do_apt=1; do_nix=1; do_docker=0 ;;
    -*)
      [[ "$1" == *d* ]] && do_dotfiles=1
      [[ "$1" == *a* ]] && do_apt=1
      [[ "$1" == *n* ]] && do_nix=1
      [[ "$1" == *D* ]] && do_docker=1
      ;;
    *)
      echo "Usage: update -A | -[d][a][n][D]"
      echo "  -A  All of the below (except Docker)"
      echo "  -d  dotfiles"
      echo "  -a  Nala (Apt)"
      echo "  -n  Nix"
      echo "  -D  Docker"
      return 1
      ;;
  esac

  (( do_dotfiles )) && mark 'dotfiles'   && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  (( do_apt      )) && mark 'Nala (Apt)' && sudo nala update && sudo nala upgrade && sudo nala autoremove
  (( do_nix      )) && mark 'Nix'        && nix registry pin nixpkgs && nix profile upgrade --all
  (( do_docker   )) && mark 'Docker'     && (cd /opt/docker && docker compose pull && docker compose down && docker compose up -d && docker image prune -f)
}

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch || $DISTRO == cachyos ]]; then

update() {
    local do_dotfiles=0 do_paru=0 do_nix=0

  case "$1" in
      -A) do_dotfiles=1; do_paru=1; do_nix=1 ;;
    -*)
      [[ "$1" == *d* ]] && do_dotfiles=1
      [[ "$1" == *p* ]] && do_paru=1
      [[ "$1" == *n* ]] && do_nix=1
      ;;
    *)
      echo "Usage: update -A | -[d][p][n]"
      echo "  -A  All of the below"
      echo "  -d  dotfiles"
      echo "  -p  Paru (Pacman)"
      echo "  -n  Nix"
      return 1
      ;;
  esac

  (( do_dotfiles )) && mark 'dotfiles'      && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  (( do_paru     )) && mark 'Paru (Pacman)' && paru -Syu
  (( do_nix      )) && mark 'Nix'           && nix registry pin nixpkgs && nix profile upgrade --all
}

fi
# =================================================================================
