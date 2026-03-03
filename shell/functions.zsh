
# funktion som hjälper till att skapa diverse templates och grejer
template() {
    # ---- helper: list templates ----
    echo_templates() {
        echo "Available templates:"
        echo "  - liu_typst"
        echo "  - gitignore"
    }

    # ---- argument handling ----

    # No argument given
    if [ -z "$1" ]; then
        echo_templates
        return 0
    fi

    # ---- template selection ----

    # LiU-mall för typst (gjord av MÄSTER MATTIAS)
    if [ "$1" = "liu_typst" ]; then
        cp -r "$HOME/templates/typst_liu_mall" .
        return 0
    fi

    # min standard .gitignore
    if [ "$1" = "gitignore" ]; then
        cp "$HOME/templates/gitignore/.gitignore" .
        return 0
    fi

    # ---- fallback: unknown template ----

    echo "Unknown template: $1"
    echo
    echo_templates
    return 1
}

# funktion som friar upp terminalen efter att den öppnar jetbrains rider
rider() {
  nohup command rider "$@" > /dev/null 2>&1 & disown
}

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

ssh() {
    if [ "$1" = "liu" ]; then
        command ssh carbe814@ssh.edu.liu.se
    elif [ "$1" = "server" ]; then
        # Testa om servern svarar på lokala LAN-IP
        if ping -c 1 -W 1 192.168.1.80 &> /dev/null; then
            command ssh carlbergvall@192.168.1.80
        else
            # Använd Tailscale-IP när LAN-IP inte svarar
            command ssh carlbergvall@100.98.222.66
        fi
    else
        command ssh "$@"
    fi
}

nnvim() {
        command aerospace move-node-to-workspace 3; aerospace workspace 3; nvim "$@"
}
