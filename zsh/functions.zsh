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



fi
# ==================================== Debian =====================================
if [[ $DISTRO == debian ]]; then



fi
# ===================================== Arch ======================================
if [[ $DISTRO == arch ]]; then



fi
# =================================================================================
