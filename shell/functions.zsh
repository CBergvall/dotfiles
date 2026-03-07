OS=$(uname)

# laddar template-funktionen från template mappen
source ~/dotfiles/templates/template.zsh

# kommando som abstraherar och förenklar skickandet av ntfy meddelanden
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
        command ~/dotfiles/executables/svt-text
    fi
}

# Function to check video codec of a file
vcodec() {
    if [ -z "$1" ]; then
        echo "Usage: vcodec <file>"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo "File not found: $1"
        return 1
    fi

    ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nw=1:nk=1 "$1"
}

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then
# kommando som flyttar terminalföntret till workspace 3 samtidigt som det öppnar neovim
# todo: gör att det öppnar ett nytt fönster istället för att flytta det existerande
    nnv() {
        command aerospace move-node-to-workspace 3; aerospace workspace 3; nvim "$@"
    }
fi
