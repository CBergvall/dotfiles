OS=$(uname)

# ===================================== macOS =====================================
if [[ $OS == Darwin ]]; then

    # brew official path command
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # tailscale
    export PATH="/Applications/Tailscale.app/Contents/MacOS:$PATH"

fi
# =================================================================================
