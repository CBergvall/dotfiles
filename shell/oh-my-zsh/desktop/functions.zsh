function ntfy() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: ntfy <topic> <message>"
    return 1
  fi

  local topic=$1
  local message=$2
  curl -d "$message" "https://ntfy.sh/$topic"
}

ssh() {
    if [ "$1" = "liu" ]; then
        command ssh carbe814@ssh.edu.liu.se
    else
        command ssh "$@"
    fi
}