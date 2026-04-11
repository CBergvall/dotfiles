OS=$(uname)

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

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then
fi
