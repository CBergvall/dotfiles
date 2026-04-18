OS=$(uname)

# MacOS-specifikt
# =================================================================================
if [[ $OS == Darwin ]]; then

    # brew official path command
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # export PATH="$(gem env home)/bin:$PATH"

fi
