# Functions

# official yazi shell wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

# command that streamlines the process of sending ntfy messages
function ntfy() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: ntfy <topic> <message>"
    return 1
  fi

  local topic=$1
  local message=$2
  curl -d "$message" "https://ntfy.sh/$topic"
}

# print out title/separator before/between commands
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

# # ===================================== Linux =====================================
# if [[ $OS == Linux ]]; then
#
#
#
# fi
# # ===================================== macOS =====================================
# if [[ $OS == Darwin ]]; then
#
#
#
# fi
# # ==================================== Debian =====================================
# if [[ $DISTRO == debian ]]; then
#
#
#
# fi
# # ===================================== Arch ======================================
# if [[ $DISTRO == arch ]]; then
#
#
#
# fi
# # =================================================================================
