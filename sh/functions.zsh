OS=$(uname)
if [[ $OS == Linux ]]; then
    DISTRO=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
fi

# laddar template-funktionen från template-mappen
source ~/dotfiles/templates/template.zsh

# kommando som förenklar skickandet av ntfy meddelanden
function ntfy() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: ntfy <topic> <message>"
    return 1
  fi

  local topic=$1
  local message=$2
  curl -d "$message" "https://ntfy.sh/$topic"
}

# svt text (två olika program, men jag har gjort att de använder samma kommando)
svt() {
    if [ -n "$1" ]; then
        # https://github.com/rickardnorlander/svt-text
        # pipx install svt-text
        command svt-text "$1"
    else
        # https://github.com/lsjoeberg/textty/releases/tag/v0.1.0
        command ~/dotfiles/bins/svt-txt
    fi
}

mark() {
  local text=${1:+" $1 "}
  local width=$COLUMNS
  local prefix=" * "
  local suffix=" * "
  local inner=$(( width - ${#prefix} - ${#suffix} ))
  local pad=$(( (inner - ${#text}) / 2 ))
  local extra=$(( inner - ${#text} - pad * 2 ))
  local bar=$(printf '%*s' $inner '' | tr ' ' '=')
  local left=${bar:0:$pad}
  local right=${bar:0:$(( pad + extra ))}
  printf "\n%s%s%s%s%s\n\n" "$prefix" "$left" "$text" "$right" "$suffix"
}

# ===================================== Linux =====================================
if [[ $OS == Linux ]]; then



fi
# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

# Updates
update() {
  local do_brew=0 do_mas=0 do_system=0

  case "$1" in
    -A) do_brew=1; do_mas=1; do_system=1 ;;
    -*)
      [[ "$1" == *b* ]] && do_brew=1
      [[ "$1" == *m* ]] && do_mas=1
      [[ "$1" == *s* ]] && do_system=1
      ;;
    *)
      echo "Usage: update -A | -[b][m][s]"
      return 1
      ;;
  esac

  (( do_brew   )) && mark 'Homebrew'        && brew update && brew upgrade && brew cleanup
  (( do_mas    )) && mark 'Mas'             && mas upgrade
  (( do_system )) && mark 'Software Update' && sudo softwareupdate -iaR
}

fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then

# Updates
update() {
  local do_apt=0 do_nix=0 do_docker=0

  case "$1" in
    -A) do_apt=1; do_nix=1; do_docker=1 ;;
    -*)
      [[ "$1" == *a* ]] && do_apt=1
      [[ "$1" == *n* ]] && do_nix=1
      [[ "$1" == *d* ]] && do_docker=1
      ;;
    *)
      echo "Usage: update -A | -[a][n][d]"
      return 1
      ;;
  esac

  (( do_apt    )) && mark 'Apt'    && sudo apt update && sudo apt upgrade && sudo apt autoremove
  (( do_nix    )) && mark 'Nix'    && nix registry pin nixpkgs && nix profile upgrade --all && nix store gc
  (( do_docker )) && mark 'Docker' && (cd /opt/docker && docker compose pull && docker compose down && docker compose up -d && docker image prune -f)
}

fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then

# Updates
update() {
  local do_paru=0

  case "$1" in
    -A) do_paru=1 ;;
    -*)
      [[ "$1" == *p* ]] && do_paru=1
      ;;
    *)
      echo "Usage: update -A | -[p]"
      return 1
      ;;
  esac

  (( do_paru )) && mark 'Paru' && paru -Syu
}

fi
# =================================================================================
