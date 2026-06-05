# Update functions

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# Updates
update() {
  local do_dotfiles=0 do_brew=0 do_nix=0 do_mas=0 do_system=0

  case "$1" in
    -A) do_dotfiles=1; do_brew=1; do_nix=1; do_mas=0; do_system=0 ;;
    -*)
      [[ "$1" == *d* ]] && do_dotfiles=1
      [[ "$1" == *b* ]] && do_brew=1
      [[ "$1" == *n* ]] && do_nix=1
      [[ "$1" == *m* ]] && do_mas=1
      [[ "$1" == *s* ]] && do_system=1
      ;;
    *)
      echo "Usage: update -A | -[d][b][n][m][s]"
      echo "  -A  All of the below (except System and Mas)"
      echo "  -d  dotfiles"
      echo "  -b  Homebrew"
      echo "  -n  Nix"
      echo "  -m  Mas (App Store)"
      echo "  -s  System Update"
      return 1
      ;;
  esac

  (( do_dotfiles )) && mark 'dotfiles'        && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  (( do_brew     )) && mark 'Homebrew'        && brew update && brew upgrade && brew cleanup
  (( do_nix      )) && mark 'Nix'             && nix registry pin nixpkgs && nix profile upgrade --all
  (( do_mas      )) && mark 'Mas (App Store)' && mas upgrade
  (( do_system   )) && mark 'System Update'   && sudo softwareupdate -iaR
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

  (( do_dotfiles )) && mark 'dotfiles'          && (cd ~/dotfiles && git pull && ./linker.sh) && source ~/.zshrc
  (( do_apt      )) && mark 'Nala (Apt)'        && sudo nala update && sudo nala upgrade && sudo nala autoremove
  (( do_nix      )) && mark 'Nix'               && nix registry pin nixpkgs && nix profile upgrade --all
  (( do_docker   )) && mark 'Docker' && (cd /opt/docker && docker compose pull && docker compose down && docker compose up -d && docker image prune -f)
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
